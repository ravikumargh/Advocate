using System;
using System.Security.Claims;
using System.Web.Http;
using WebApi.Helper;

namespace WebApi.Controllers
{
    public class BaseApiController : ApiController
    {
        public AppUser CurrentUser
        {
            get
            {
                return new AppUser(this.User as ClaimsPrincipal);
            }
        }

        public enum Role
        {
            SuperAdmin = 1,
            Admin = 2,
            Senior = 3,
            Junior = 4,
            Client = 5,
            Public = 6
        }
    }
}
