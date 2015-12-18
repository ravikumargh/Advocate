 
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
    public class DocumentTypeController : ApiController
    {
        //IDocumentTypeService<DocumentType> DocumentTypeService;
        private IRepository<DocumentType> DocumentTypeRepository;

        public DocumentTypeController(IRepository<DocumentType> DocumentTypeRepository)
        {
            this.DocumentTypeRepository = DocumentTypeRepository;
        }
        // GET api/<controller>
        public IEnumerable<DocumentType> Get()
        {
            return DocumentTypeRepository.GetAll();
            //return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post(DocumentType documentType)
        {
            //documentType.Id = Guid.NewGuid();
            DocumentTypeRepository.Add(documentType);

        }

        // PUT api/<controller>/5
        public void Put(DocumentType documentType)
        {
            DocumentTypeRepository.Update(documentType);
        }

        // DELETE api/<controller>/5
        public void Delete(long id)
        {
            DocumentTypeRepository.Delete(id);

        }
    }
}