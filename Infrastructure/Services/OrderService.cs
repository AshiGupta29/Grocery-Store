using Core.Entities;
using Core.Entities.OrderAggregate;
using Core.Interfaces;
using Core.Specifications;
using Infrastructure.Data.Specifications;

namespace Infrastructure.Services
{ 
    public class OrderService : IOrderService
    {
        private readonly IBasketRepository basketRepo;
        private readonly IUnitOfWork unitOfWork;
        private readonly IProductRepository productRepo;

        public OrderService(IBasketRepository basketRepo, IUnitOfWork unitOfWork,IProductRepository productRepo)
        {
            this.basketRepo = basketRepo;
            this.unitOfWork = unitOfWork;
            this.productRepo = productRepo;
        }

        public async Task<Order> CreateOrderAsync(string buyerEmail, string basketId)
        {
            //get basket from the repo
            var basket = await this.basketRepo.GetBasketAsync(basketId);

            //get items from the product repo
            var items = new List<OrderItem>();
            foreach(var item in basket.Items)
            {
                var productItem = await this.unitOfWork.Repository<Product>().GetByIdAsync(item.Id);
                var itemOrdered = new ProductItemOrdered(productItem.Id, productItem.Name, productItem.ImageUrl);
                var orderItem = new OrderItem(itemOrdered, productItem.Price, item.Quantity, productItem.Discount);
                await this.productRepo.UpdateProductQuantityAsync(item.Id, item.Quantity);
                items.Add(orderItem);
            }

            //calculate Total
            var total = items.Sum(item => (item.Price - (item.Price * item.Discount) / 100) * item.Quantity);

            //create order
            var order = new Order(items, buyerEmail,total);
            this.unitOfWork.Repository<Order>().Add(order);

            //save to db
            var result = await this.unitOfWork.Complete();

            if(result <= 0) return null;

            //delete basket
            await this.basketRepo.DeleteBasketAsync(basketId);

            //return order
            return order;
        }

        public async Task<Order> GetOrderByIdAsync(int id, string buyerEmail)
        {
            var spec = new OrdersWithItemsAndOrderingSpecification(id,buyerEmail);
            
            return await this.unitOfWork.Repository<Order>().GetEntityWithSpec(spec);
        }

        public async Task<IReadOnlyList<Order>> GetOrdersForUserAsync(string buyerEmail)
        {
            var spec = new OrdersWithItemsAndOrderingSpecification(buyerEmail);

            return await this.unitOfWork.Repository<Order>().ListAsync(spec);
        }

        public async Task<IEnumerable<string>> GetMostOrderedProductsAsync(int month, int year)
        {
            if (year < 1 || month < 1 || month > 12)
            {
                // Handle invalid input
                throw new ArgumentException("Invalid year or month.");
            }

            var startDate = new DateTime(year, month, 1);
            var endDate = startDate.AddMonths(1);

            var orders = await unitOfWork.Repository<Order>().ListAsync(
                new OrdersWithItemsAndOrderingSpecification(startDate, endDate)
            );

            var orderItems = orders.SelectMany(o => o.OrderItems);

            var productGroups = orderItems
                .GroupBy(oi => oi.ItemOrdered.ProductItemId) 
                .Select(g => new
                {
                    ProductItemId = g.Key, 
                    Quantity = g.Sum(oi => oi.Quantity)
                })
                .OrderByDescending(g => g.Quantity)
                .Take(5);

            var productIds = productGroups.Select(g => g.ProductItemId).ToList();

            var productList = await unitOfWork.Repository<Product>()
                .ListIdAsync(new ProductsWithNamesSpecification(productIds),
                p => new (p.Id, p.Name));

            var productNames = productList
                .OrderByDescending(p => productIds.IndexOf(p.Id))
                .Select(p => p.Name)
                .ToList();

            return productNames;
        }
        
    }
}