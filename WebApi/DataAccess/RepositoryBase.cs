using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApi.Models;

namespace WebApi.DataAccess
{
    public class RepositoryBase
    {
        #region Properties
        private AdvocateEntities dataContext;

        protected AdvocateEntities DbContext
        {
            get { return dataContext ?? (dataContext = new AdvocateEntities()); }
        }
        #endregion
    }
}