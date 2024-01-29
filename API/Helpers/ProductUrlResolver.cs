using API.Dtos;
using AutoMapper;
using Core.Entities;

namespace API.Helpers
{
    public class ProductUrlResolver : IValueResolver<Product, ProductToReturnDto, string>
    {
        private readonly IConfiguration config;
        public ProductUrlResolver(IConfiguration config)
        {
            this.config = config;
            
        }
        public string Resolve(Product source, ProductToReturnDto destination, string destMember, ResolutionContext context)
        {
           if(!string.IsNullOrEmpty(source.ImageUrl))
           {
             return this.config["ApiUrl"] + source.ImageUrl;
           }

           return null;
        }
    }
}