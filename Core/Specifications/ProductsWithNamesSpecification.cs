using Core.Entities;
using Core.Specifications;
using System.Linq.Expressions;

namespace Infrastructure.Data.Specifications
{
    public class ProductsWithNamesSpecification : BaseSpecification<Product>
    {
        public ProductsWithNamesSpecification(IEnumerable<int> productIds)
            : base(BuildSpecificationExpression(productIds))
        {
        }

        private static Expression<Func<Product, bool>> BuildSpecificationExpression(IEnumerable<int> productIds)
        {
            return p => productIds.Contains(p.Id);
        }
    }
}
