namespace API.Dtos
{
    public class UserDto
    {
        public string Email { get; set; }
        public string DisplayName { get; set; }
        public string Token { get; set; }
        public string PhoneNumber {get; set;}
        public bool IsAdmin { get; set; }
    }
}