 
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
    public class FirmController : ApiController
    {
        //IFirmService<Firm> firmService;
        private IRepository<Firm> firmRepository;

        public FirmController(IRepository<Firm> firmRepository)
        {
            this.firmRepository = firmRepository;
        }
        // GET: api/Firm
        public IEnumerable<Firm> Get()
        {
            return firmRepository.GetAll();
        }

        // GET: api/Firm/5
        public Firm Get(long id)
        {
            return firmRepository.GetById(id);
        }

        // POST: api/Firm
        public void Post(Firm firm)
        {
            firmRepository.Add(firm);

        }

        // PUT: api/Firm/5
        public void Put(Firm firm)
        {
            firmRepository.Update(firm);
        }

        // DELETE: api/Firm/5
        public void Delete(long id)
        {
            firmRepository.Delete(id);

        }
    }
}
