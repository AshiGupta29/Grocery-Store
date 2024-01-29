namespace API.Dtos
{
    public class OrderToReturnDto
    {
        public int Id { get; set; }
        public string BuyerEmail { get; set; }
        public DateTime Orderdate { get; set; } 
        public IReadOnlyList<OrderItemDto> OrderItems { get; set; }
        public decimal Total { get; set; }
    }
}