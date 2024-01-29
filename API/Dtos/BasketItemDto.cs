using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace API.Dtos
{
    public class BasketItemDto
    {
        [Required]
        public int Id { get; set; }
        
        [Required]
        public string ProductName { get; set; }
        
        [Required]
        [Range(0.1, double.MaxValue, ErrorMessage = "Price must be greater than zero")]
        public decimal Price { get; set; }
        
        [Required]
        [Range(1, double.MaxValue,  ErrorMessage = "Quantity must be at least 1")]
        public int Quantity { get; set; }
        
        [Required]
        public string ImageUrl { get; set; }
        
        [Required]
        public string ProductCategory { get; set; }

        public decimal Discount {get; set;}
        
        
    }
}