using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using WebApi.Models;

namespace WebApi.DataAccess
{
    public class FirmRepository : RepositoryBase, IFirmRepository
    {
         
        public void Add(Firm entity)
        {
            DbContext.Firms.Add(entity);
            DbContext.SaveChanges();
        }

        public void Update(Firm entity)
        {
            Firm firm = GetById(entity.Id);
            firm.Name = entity.Name;
            DbContext.SaveChanges();
        }

        public void Delete(long id)
        {
            Firm firm = GetById(id);
            DbContext.Firms.Remove(firm);
            DbContext.SaveChanges();
        }

        public void Delete(Expression<Func<Firm, bool>> where)
        {
            Firm firm = Get(where);
            DbContext.Firms.Remove(firm);
            DbContext.SaveChanges();
        }

        public Firm GetById(long id)
        {
            return DbContext.Firms.Where(w => w.Id == id).FirstOrDefault();

        }

        public Firm Get(Expression<Func<Firm, bool>> where)
        {
            return DbContext.Firms.Where(where).FirstOrDefault<Firm>();

        }

        public IEnumerable<Firm> GetAll()
        {
            return DbContext.Firms.ToList();
        }

        public IEnumerable<Firm> GetMany(Expression<Func<Firm, bool>> where)
        {
            return DbContext.Firms.Where(where).ToList();

        }
    }

    public interface IFirmRepository : IRepository<Firm>
    {

    }

}