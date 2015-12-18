
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Web.Http;
using WebApi.DataAccess;
using WebApi.Models;

namespace WebApi.Controllers
{
    public class DocumentController : ApiController
    {
        //IDocumentService<Document> DocumentService;
        private IRepository<Document> DocumentRepository;

        public DocumentController(IRepository<Document> DocumentRepository)
        {
            this.DocumentRepository = DocumentRepository;
        }
        // GET api/<controller>
        public IEnumerable<Document> Get()
        {
            return DocumentRepository.GetAll();
            //return new string[] { "value1", "value2" };
        }

        // GET api/<controller>/5
        public string Get(int id)
        {
            return "value";
        }

        // POST api/<controller>
        public void Post(DocumentViewModel doc)
        //public void Post()
        {
            Document document = new Document();
            string fileType = doc.type;
            MemoryStream file_Strm = new MemoryStream(Encoding.UTF8.GetBytes(doc.data));

            int fileSize = doc.size;
            byte[] fileRcrd = new byte[fileSize];
            file_Strm.Read(fileRcrd, 0, fileSize);
            document.Content = fileRcrd;
            document.Name = doc.name;
            document.UserId = doc.UserId;
            document.Description = doc.Description;
            document.DocumentType = doc.DocumentType;
            document.Size = doc.size;
            document.Type = doc.type;
            DocumentRepository.Add(document);

            /*
            //document.Id = Guid.NewGuid();
            //DocumentRepository.Add(document);
            System.Web.HttpFileCollection hfc = System.Web.HttpContext.Current.Request.Files;
            Document document = new Document();
            string fileType = hfc[0].ContentType;
            Stream file_Strm = hfc[0].InputStream;

            int fileSize = hfc[0].ContentLength;
            byte[] fileRcrd = new byte[fileSize];
            file_Strm.Read(fileRcrd, 0, fileSize);
            document.Content = fileRcrd;
            document.Name = hfc[0].FileName;
            DocumentRepository.Add(document);
            */
        }

        // PUT api/<controller>/5
        public void Put(Document document)
        {
            DocumentRepository.Update(document);
        }

        // DELETE api/<controller>/5
        public void Delete(int id)
        {
            DocumentRepository.Delete(id);
        }
    }
}