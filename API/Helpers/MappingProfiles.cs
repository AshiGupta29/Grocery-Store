using API.Dtos;
using AutoMapper;
using Core.Entities;
using Core.Entities.OrderAggregate;

namespace API.Helpers
{
    public class MappingProfiles : Profile
    {
        public MappingProfiles()
        {
            CreateMap<Product, ProductToReturnDto>()
              .ForMember(d => d.ProductCategory, o => o.MapFrom(s => s.ProductCategory.Name))
              .ForMember(d => d.ImageUrl, o => o.MapFrom<ProductUrlResolver>());
            CreateMap<ProductCreateDto, Product>().ReverseMap();
            CreateMap<CustomerBasketDto, CustomerBasket>();
            CreateMap<BasketItemDto, BasketItem>();
            CreateMap<Order, OrderToReturnDto>();
            CreateMap<OrderItem, OrderItemDto>()
            .ForMember(d => d.ProductId, o => o.MapFrom(s => s.ItemOrdered.ProductItemId))
            .ForMember(d => d.ProductName, o => o.MapFrom(s => s.ItemOrdered.ProductName))
            .ForMember(d => d.ImageUrl, o => o.MapFrom(s => s.ItemOrdered.ImageUrl))
            .ForMember(d => d.ImageUrl, o => o.MapFrom<OrderItemUrlResolver>());
            CreateMap<Review, ReviewDto>().ReverseMap();

        }
    }
}