using API.Dtos;
using API.Errors;
using API.Extensions;
using AutoMapper;
using Core.Entities;
using Core.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace API.Controllers
{
    public class ReviewsController : BaseApiController
    {
        private readonly IMapper mapper;
        private readonly IReviewService reviewService;

        public ReviewsController(IMapper mapper,IReviewService reviewService)
        {
            this.reviewService = reviewService;
            this.mapper = mapper;
        }

        [Authorize]
        [HttpPost]
        public async Task<ActionResult<Review>> CreateReview(ReviewDto reviewDto)
        {
             try
            {
                var email = HttpContext.User.RetrieveEmailFromPrincipal();
                var review = await this.reviewService.AddReviewAsync(email, reviewDto.ProductId, reviewDto.Description);
                var reviewDtoResult = this.mapper.Map<ReviewDto>(review);
                return Ok(reviewDtoResult);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception)
            {
                return StatusCode(500, new ApiResponse(500, "An error occurred while adding the review."));
            }
        }

        [HttpGet("{productId}")]
        public async Task<ActionResult<IReadOnlyList<OrderToReturnDto>>> GetOrdersForUser(int productId)
        {
            var reviews = await this.reviewService.GetReviewsForProductAsync(productId);
            var reviewDtos = this.mapper.Map<IEnumerable<ReviewDto>>(reviews);
            return Ok(reviewDtos);
        }
    }
}