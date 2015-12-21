using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Web;

namespace WebApi.Helper
{
    public class AppUser : ClaimsPrincipal
    {
        public AppUser(ClaimsPrincipal principal)
            : base(principal)
        {
        }

        public string Name
        {
            get
            {
                return this.FindFirst(ClaimTypes.Name).Value;
            }
        }
        public int RoleId
        {
            get
            {
                var RoleClaim = this.FindFirst(ClaimTypes.Role);
                if (RoleClaim != null)
                {
                    return Convert.ToInt32(RoleClaim.Value);
                }
                else
                {
                    return 0;
                }
            }
        }
        public int Id
        {
            get
            {
                var UserId = this.FindFirst("Id");
                if (UserId != null)
                {
                    return Convert.ToInt32(UserId.Value);
                }
                else
                {
                    return 0;
                }
            }
        }

    }
}