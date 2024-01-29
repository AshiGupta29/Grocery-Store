namespace Core.Entities
{
    public class Review : BaseEntity
    {
        public Review()
        {
        }

        public Review(string userEmail, string description, Product product) 
        {
            this.UserEmail = userEmail;
            this.Description = description;
            this.Product = product;
   
        }
        public string UserEmail { get; set; }
        public int ProductId { get; set; }
        public string Description { get; set; }
        public DateTime DatePosted { get; set; } = DateTime.UtcNow;

        // Navigation properties
        public Product Product { get; set; }

    }
}