using System.ComponentModel.DataAnnotations;

namespace API.Dtos
{
    public class RegisterDto
    {
        [Required(ErrorMessage = "Please enter your username")]
        [Display(Name = "Name")]
         public string DisplayName { get; set; }

         [Required(ErrorMessage = "Please enter your Email Address")]
         [EmailAddress(ErrorMessage = "Please provide a valid Email Address")]
         [Display(Name = "Email Address")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please enter your phone number")]
        [Phone]
        [RegularExpression("^(\\d{10})$", ErrorMessage = "Please enter a 10-digit phone number only.")]
        public string PhoneNumber {get; set;}

        [Required(ErrorMessage = "Please enter your Password")]
        [Display(Name = "Password")]
        [Compare("ConfirmPassword", ErrorMessage = "Password does not match")]
        [RegularExpression("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$", 
        ErrorMessage ="Password must have 1 alphabet, 1 number, 1 non alphanumeric and at least 8 characters")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Please confirm your Password")]
        [Display(Name = "Confirm Password")]
        [DataType(DataType.Password, ErrorMessage = "Password does not match")]
        public string ConfirmPassword { get; set; }

        

    }
}