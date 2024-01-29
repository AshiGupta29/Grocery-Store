using System.Text.Json;
using Core.Entities;

namespace Infrastructure.Data
{
    public class StoreContextSeed
    {
        public static async Task SeedAsync(StoreContext context)
        {
            if (!context.ProductCategories.Any())
            {
                var categoriesData = File.ReadAllText("../Infrastructure/Data/SeedData/Categories.json");
                var categories = JsonSerializer.Deserialize<List<ProductCategory>>(categoriesData);
                context.ProductCategories.AddRange(categories);
            }
            if (!context.Products.Any())
            {
                var productData = File.ReadAllText("../Infrastructure/Data/SeedData/products.json");
                var products = JsonSerializer.Deserialize<List<Product>>(productData);
                context.Products.AddRange(products);
            }


            if (context.ChangeTracker.HasChanges()) await context.SaveChangesAsync();
        }
    }

}