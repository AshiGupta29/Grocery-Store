namespace Core.Entities.OrderAggregate
{
    public class Order : BaseEntity
    {
        public Order()
        {
        }

        public Order(IReadOnlyList<OrderItem> orderItems, string buyerEmail, decimal total)
        {
            BuyerEmail = buyerEmail;
            OrderItems = orderItems;
            Total = total;
        }

        public string BuyerEmail { get; set; }
        public DateTime Orderdate { get; set; } = DateTime.UtcNow;
        public IReadOnlyList<OrderItem> OrderItems { get; set; }
        public decimal Total { get; set; }
    }
}