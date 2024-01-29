using Core.Entities;
using Core.Interfaces;
using Infrastructure.Data.Specifications;

namespace Infrastructure.Services
{
    public class ReviewService : IReviewService
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IProductRepository productRepo;

        public ReviewService(IUnitOfWork unitOfWork, IProductRepository productRepo)
        {
            this.unitOfWork = unitOfWork;
            this.productRepo = productRepo;
        }

        public async Task<Review> AddReviewAsync(string userEmail, int productId, string description)
        {
            var product = await this.unitOfWork.Repository<Product>().GetByIdAsync(productId);

            if (product == null)
            {
                throw new ArgumentException("Product not found");
            }

            var review = new Review(userEmail, description, product);

            this.unitOfWork.Repository<Review>().Add(review);
            await this.unitOfWork.Complete();

            return review;
        }

        public async Task<List<Review>> GetReviewsForProductAsync(int productId)
        {
            var spec = new ReviewsWithProductSpecification(productId);
            var reviews = await this.unitOfWork.Repository<Review>().ListAsync(spec);
            return reviews.ToList();
        }

    }
}