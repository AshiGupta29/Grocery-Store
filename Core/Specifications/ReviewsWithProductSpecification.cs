using Core.Entities;
using Core.Specifications;

namespace Infrastructure.Data.Specifications
{
    public class ReviewsWithProductSpecification : BaseSpecification<Review>
    {
        public ReviewsWithProductSpecification(int productId)
            : base(r => r.ProductId == productId)
        {
            AddInclude(r => r.Product);
        }
    }
}
