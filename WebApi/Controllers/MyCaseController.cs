 
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using WebApi.DataAccess;
using WebApi.Models;

namespace WebApi.Controllers
{
    public class MyCaseController : BaseApiController
    {
        //ICaseService<Case> caseService;
        private ICaseRepository<Case> caseRepository;

        public MyCaseController(ICaseRepository<Case> caseRepository)
        {
            this.caseRepository = caseRepository;
        }
        // GET: api/Case
        public IEnumerable<Case> Get()
        {
            if (CurrentUser.RoleId == Convert.ToInt64(Role.SuperAdmin))
            {                
                return caseRepository.GetByAdvocateId(CurrentUser.Id);
            }
            else
            {
                   return caseRepository.GetByClientId(CurrentUser.Id);
            }
        }

        // GET: api/Case/5
        public Case Get(long id)
        {
            return caseRepository.GetById(id);
        }

        // POST: api/Case
        public void Post(Case _case)
        {
            caseRepository.Add(_case);

        }

        // PUT: api/Case/5
        public void Put(Case _case)
        {
            caseRepository.Update(_case);
        }

        // DELETE: api/Case/5
        public void Delete(long id)
        {
            caseRepository.Delete(id);

        }
    }
}
