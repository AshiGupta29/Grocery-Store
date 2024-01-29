using Core.Entities;
using Microsoft.AspNetCore.Mvc;
using Core.Interfaces;
using Core.Specifications;
using API.Dtos;
using AutoMapper;
using API.Errors;
using API.Helpers;

namespace API.Controllers
{
    public class ProductsController : BaseApiController
    {
        private readonly IMapper mapper;
        private readonly IUnitOfWork unitOfWork;

        public ProductsController(IMapper mapper, IUnitOfWork unitOfWork)
        {
            this.mapper = mapper;
            this.unitOfWork = unitOfWork;
        }

        [HttpGet]
        public async Task<ActionResult<Pagination<ProductToReturnDto>>> GetProducts([FromQuery] ProductSpecParams productParams)
        {
            var spec = new ProductsWithCategoriesSpecification(productParams);

            var countSpec = new ProductsWithFiltersForCountSpecification(productParams);

            var totalItems = await this.unitOfWork.Repository<Product>().CountAsync(countSpec);

            var products = await this.unitOfWork.Repository<Product>().ListAsync(spec);

            var data = this.mapper.Map<IReadOnlyList<Product>, IReadOnlyList<ProductToReturnDto>>(products);

            return Ok(new Pagination<ProductToReturnDto>(productParams.PageIndex, productParams.PageSize, totalItems, data));
        }

        [HttpGet("{id}")]
        [ProducesResponseType(StatusCodes.Status200OK)]
        [ProducesResponseType(typeof(ApiResponse), StatusCodes.Status404NotFound)]
        public async Task<ActionResult<ProductToReturnDto>> GetProducts(int id)
        {
            var spec = new ProductsWithCategoriesSpecification(id);
            var product = await this.unitOfWork.Repository<Product>().GetEntityWithSpec(spec);

            if (product == null) return NotFound(new ApiResponse(404));
            return this.mapper.Map<Product, ProductToReturnDto>(product);
        }

        [HttpGet("categories")]
        public async Task<ActionResult<IReadOnlyList<ProductCategory>>> GetProductCategories()
        {
            return Ok(await this.unitOfWork.Repository<ProductCategory>().ListAllAsync());
        }

        [HttpPost]
        public async Task<ActionResult<Product>> AddProduct([FromBody] ProductCreateDto productDto)
        {

            // Map the DTO to the Product entity
            var product = mapper.Map<ProductCreateDto, Product>(productDto);

            // Add the product to the repository
            unitOfWork.Repository<Product>().Add(product);
            await unitOfWork.Complete();

            // Map the created product back to the DTO and return it
            var createdProductDto = mapper.Map<Product, ProductCreateDto>(product);
            return CreatedAtAction(nameof(GetProducts), new { id = createdProductDto.Name }, createdProductDto);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<Product>> UpdateProduct(int id, [FromBody] ProductCreateDto productDto)
        {
            // Get the product from the repository
            var product = await this.unitOfWork.Repository<Product>().GetByIdAsync(id);
            if (product == null)
            {
                return NotFound(new ApiResponse(404));
            }

            mapper.Map(productDto, product);

            // Save the changes to the repository
            unitOfWork.Repository<Product>().Update(product);
            await this.unitOfWork.Complete();

            // Return the updated product
            return product;
        }

        [HttpDelete("{id}")]
        public async Task<ActionResult> DeleteProduct(int id)
        {
            // Get the product from the repository
            var product = await this.unitOfWork.Repository<Product>().GetByIdAsync(id);
            if (product == null)
            {
                return NotFound(new ApiResponse(404));
            }

            // Delete the product from the repository
            this.unitOfWork.Repository<Product>().Delete(product);
            await this.unitOfWork.Complete();

            // Return a success response
            return NoContent();
        }


    }
}