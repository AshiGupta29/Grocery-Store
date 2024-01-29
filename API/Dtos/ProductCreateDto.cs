using System.ComponentModel.DataAnnotations;

namespace API.Dtos
{
    public class ProductCreateDto
    {

        [Required]
        public string Name { get; set; }
        
        [Required]
        public string Description { get; set; }
        
        [Required]
        public int ProductCategoryId { get; set; }

        [Required]
        public int Quantity { get; set; }
        
        [Required]
        public string ImageUrl { get; set; }
        
        [Required]
        public decimal Price { get; set; }

        public decimal Discount { get; set; }

        public string ProductSpecification { get; set; }
    }
}