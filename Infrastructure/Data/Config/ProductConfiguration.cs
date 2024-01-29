using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Infrastructure.Data.Config
{
    public class ProductConfiguration : IEntityTypeConfiguration<Product>
    {
        public void Configure(EntityTypeBuilder<Product> builder)
        {
            builder.Property(p => p.Name).IsRequired().HasMaxLength(100);
            builder.Property(p => p.Description).IsRequired().HasMaxLength(255);
            builder.Property(p => p.Quantity).IsRequired();
            builder.Property(p => p.ImageUrl).IsRequired();
            builder.Property(p => p.Price).IsRequired().HasColumnType("decimal(18,2)");
            builder.Property(p => p.Discount).HasColumnType("decimal(18,2)");
            builder.Property(p => p.ProductSpecification).HasMaxLength(100);
            builder.HasOne(p => p.ProductCategory).WithMany().HasForeignKey(p => p.ProductCategoryId);
            
        }
    }
}