using System.ComponentModel.DataAnnotations;
using Microsoft.AspNetCore.Identity;

namespace Core.Entities.Identity
{
    public class AppUser : IdentityUser
    {
        [MaxLength(50)]
        public string DisplayName { get; set; }
        public bool IsAdmin { get; set; }
    }
}