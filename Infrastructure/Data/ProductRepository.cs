using Core.Entities;
using Core.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace Infrastructure.Data
{
    public class ProductRepository : IProductRepository
    {
        private readonly StoreContext context;
        public ProductRepository(StoreContext context)
        {
            this.context = context;
        }

        public async Task<Product> GetProductByIdAsync(int id)
        {
            return await this.context.Products
            .Include(p => p.ProductCategory)
            .FirstOrDefaultAsync(p => p.Id == id);
        }

        public async Task<IReadOnlyList<ProductCategory>> GetProductCategoryAsync()
        {
            return await this.context.ProductCategories.ToListAsync();
        }

        public async Task<IReadOnlyList<Product>> GetProductsAsync()
        {
            return await this.context.Products
            .Include(p => p.ProductCategory)
            .ToListAsync();
        }

        public async Task<bool> UpdateProductQuantityAsync(int id, int quantity)
        {
            var product = await this.context.Products.FindAsync(id);

            if (product != null)
            {
                product.Quantity -= quantity;
                await this.context.SaveChangesAsync();
                return true;
            }

            return false;
        }
    }
}