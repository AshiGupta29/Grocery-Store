using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using API.Dtos;
using AutoMapper;
using Core.Entities;

namespace API.Helpers
{

   public class NullValueResolver : IValueResolver<ProductCreateDto, Product, object>
{
    public object Resolve(ProductCreateDto source, Product destination, object destMember, ResolutionContext context)
    {
        return null;
    }
}


}
