using Core.Entities;

namespace Core.Interfaces
{
    public interface IReviewService
    {
        
        Task<Review> AddReviewAsync(string buyerEmail, int productId, string basketId);
       Task<List<Review>> GetReviewsForProductAsync(int productId);
    }
}