using Core.Entities;
namespace Core.Interfaces
{
    public interface IProductRepository
    {
        Task<Product> GetProductByIdAsync(int id);
        Task<IReadOnlyList<Product>> GetProductsAsync();
        Task<IReadOnlyList<ProductCategory>> GetProductCategoryAsync();
        Task<bool> UpdateProductQuantityAsync(int id, int quantity);
    }
}