namespace API.Dtos
{
    public class ProductToReturnDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ProductCategory { get; set; }
        public int Quantity { get; set; }
        public string ImageUrl { get; set; }
        public decimal Price { get; set; }
        public decimal Discount { get; set; }
        public string ProductSpecification { get; set; }
    }
}