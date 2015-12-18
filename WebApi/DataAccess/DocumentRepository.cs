using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using WebApi.Models;

namespace WebApi.DataAccess
{
    public class DocumentRepository : RepositoryBase, IDocumentRepository
    {
         
        public void Add(Document entity)
        {
            DbContext.Documents.Add(entity);
            DbContext.SaveChanges();
        }

        public void Update(Document entity)
        {
            Document document = GetById(entity.Id);
            document.Name = entity.Name;
            DbContext.SaveChanges();
        }

        public void Delete(long id)
        {
            Document document = GetById(id);
            DbContext.Documents.Remove(document);
            DbContext.SaveChanges();
        }

        public void Delete(Expression<Func<Document, bool>> where)
        {
            Document document = Get(where);
            DbContext.Documents.Remove(document);
            DbContext.SaveChanges();
        }

        public Document GetById(long id)
        {
            return DbContext.Documents.Where(w => w.Id == id).FirstOrDefault();

        }

        public Document Get(Expression<Func<Document, bool>> where)
        {
            return DbContext.Documents.Where(where).FirstOrDefault<Document>();

        }

        public IEnumerable<Document> GetAll()
        {
            return DbContext.Documents.ToList();
        }

        public IEnumerable<Document> GetMany(Expression<Func<Document, bool>> where)
        {
            return DbContext.Documents.Where(where).ToList();

        }
    }

    public interface IDocumentRepository : IRepository<Document>
    {

    }

}