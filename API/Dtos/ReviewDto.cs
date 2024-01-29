namespace API.Dtos
{
    public class ReviewDto
    {
        public int ProductId { get; set; }
        public string UserEmail { get; set; }
        public string Description { get; set; }
        public DateTime DatePosted { get; set; } 
    }
}