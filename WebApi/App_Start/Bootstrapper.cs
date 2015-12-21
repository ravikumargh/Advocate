using Microsoft.Practices.Unity;
 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using WebApi.DataAccess;
using WebApi.Models;

namespace WebApi
{
    public static class Bootstrapper
    {
        public static void Initialise()
        {
            var container = BuildUnityContainer();
            GlobalConfiguration.Configuration.DependencyResolver = new Unity.WebApi.UnityDependencyResolver(container);
        }

        private static IUnityContainer BuildUnityContainer()
        {
            var container = new UnityContainer();
            //register the Address Repository
            container.RegisterType<IRepository<Role>, RoleRepository>();
            container.RegisterType<IRepository<User>, UserRepository>();
            container.RegisterType<IRepository<Document>, DocumentRepository>();
            container.RegisterType<IRepository<DocumentType>, DocumentTypeRepository>();
            container.RegisterType<ICaseRepository<Case>, CaseRepository<Case>>();
            container.RegisterType<IRepository<Firm>, FirmRepository>();
            return container;
        }
    }
}