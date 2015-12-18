using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using WebApi.Models;

namespace WebApi.DataAccess
{
    public class DocumentTypeRepository : RepositoryBase, IDocumentTypeRepository
    {
         
        public void Add(DocumentType entity)
        {
            DbContext.DocumentTypes.Add(entity);
            DbContext.SaveChanges();
        }

        public void Update(DocumentType entity)
        {
            DocumentType documentType = GetById(entity.Id);
            documentType.Name = entity.Name;
            DbContext.SaveChanges();
        }

        public void Delete(long id)
        {
            DocumentType documentType = GetById(id);
            DbContext.DocumentTypes.Remove(documentType);
            DbContext.SaveChanges();
        }

        public void Delete(Expression<Func<DocumentType, bool>> where)
        {
            DocumentType documentType = Get(where);
            DbContext.DocumentTypes.Remove(documentType);
            DbContext.SaveChanges();
        }

        public DocumentType GetById(long id)
        {
            return DbContext.DocumentTypes.Where(w => w.Id == id).FirstOrDefault();

        }

        public DocumentType Get(Expression<Func<DocumentType, bool>> where)
        {
            return DbContext.DocumentTypes.Where(where).FirstOrDefault<DocumentType>();

        }

        public IEnumerable<DocumentType> GetAll()
        {
            return DbContext.DocumentTypes.ToList();
        }

        public IEnumerable<DocumentType> GetMany(Expression<Func<DocumentType, bool>> where)
        {
            return DbContext.DocumentTypes.Where(where).ToList();

        }
    }

    public interface IDocumentTypeRepository : IRepository<DocumentType>
    {

    }

}