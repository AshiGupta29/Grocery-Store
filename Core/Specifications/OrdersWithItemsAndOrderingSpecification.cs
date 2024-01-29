using System;
using Core.Entities.OrderAggregate;

namespace Core.Specifications
{
    public class OrdersWithItemsAndOrderingSpecification : BaseSpecification<Order>
    {
        public OrdersWithItemsAndOrderingSpecification(string email) : base(o => o.BuyerEmail == email)
        {
            AddInclude(o => o.OrderItems);
            AddOrderByDescending(o => o.Orderdate);
        }

        public OrdersWithItemsAndOrderingSpecification(DateTime startDate, DateTime endDate) : base(o =>
            o.Orderdate >= startDate && o.Orderdate < endDate)
        {
            AddInclude(o => o.OrderItems);
            AddOrderByDescending(o => o.Orderdate);
        }

        public OrdersWithItemsAndOrderingSpecification(int id, string email)
            : base(o => o.Id == id && o.BuyerEmail == email)
        {
            AddInclude(o => o.OrderItems);
        }
    }
}
