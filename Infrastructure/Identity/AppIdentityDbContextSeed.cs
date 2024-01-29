using Core.Entities.Identity;
using Microsoft.AspNetCore.Identity;

namespace Infrastructure.Identity
{
    public class AppIdentityDbContextSeed
    {
        public static async Task SeedUsersAsync(UserManager<AppUser> userManager)
        {
            if (userManager.Users.Any())
            {
                var users = new List<AppUser>
                {
                    new AppUser
                    {
                        DisplayName = "Ashi Gupta",
                        Email = "ashigupta0529@gmail.com",
                        UserName = "ashigupta0529@gmail.com",
                        PhoneNumber = "8448963670",
                        IsAdmin = true
                    },
                    new AppUser
                    {
                        DisplayName = "Admin",
                        Email = "admin@gmail.com",
                        UserName = "admin@gmail.com",
                        PhoneNumber = "8448963690",
                        IsAdmin = true
                    },
                    new AppUser
                    {
                        DisplayName = "Test",
                        Email = "test@gmail.com",
                        UserName = "test@gmail.com",
                        PhoneNumber = "8648963690",
                        IsAdmin = true
                    },
                };

                foreach (var user in users)
               {
                   await userManager.CreateAsync(user, "ashi@2000");
                }           
            }
        }
    }
}