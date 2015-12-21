 
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
    public class CaseController : ApiController
    {
        //ICaseService<Case> caseService;
        private IRepository<Case> caseRepository;

        public CaseController(IRepository<Case> caseRepository)
        {
            this.caseRepository = caseRepository;
        }
        // GET: api/Case
        public IEnumerable<Case> Get()
        {
            return caseRepository.GetAll();
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
