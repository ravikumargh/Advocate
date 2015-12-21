using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using WebApi.Models;

namespace WebApi.DataAccess
{
    public class CaseRepository<T> : RepositoryBase, ICaseRepository<Case>
         where T : class
    {

        public void Add(Case entity)
        {
            DbContext.Cases.Add(entity);
            DbContext.SaveChanges();
        }

        public void Update(Case entity)
        {
            Case _case = GetById(entity.Id);
            _case.Number = entity.Number;
            _case.Description = entity.Description;
            _case.ClientId = entity.ClientId;
            _case.AdvocateId = entity.AdvocateId;
            DbContext.SaveChanges();
        }

        public void Delete(long id)
        {
            Case _case = GetById(id);
            DbContext.Cases.Remove(_case);
            DbContext.SaveChanges();
        }

        public void Delete(Expression<Func<Case, bool>> where)
        {
            Case _case = Get(where);
            DbContext.Cases.Remove(_case);
            DbContext.SaveChanges();
        }

        public Case GetById(long id)
        {
            return DbContext.Cases.Where(w => w.Id == id).FirstOrDefault();

        }

        public Case Get(Expression<Func<Case, bool>> where)
        {
            return DbContext.Cases.Where(where).FirstOrDefault<Case>();

        }

        public IEnumerable<Case> GetAll()
        {
            return DbContext.Cases.ToList();
        }

        public IEnumerable<Case> GetMany(Expression<Func<Case, bool>> where)
        {
            return DbContext.Cases.Where(where).ToList();

        }

        public IEnumerable<Case> GetByAdvocateId(long id)
        {
            return DbContext.Cases.Where(w => w.AdvocateId == id);
        }


        public IEnumerable<Case> GetByClientId(long id)
        {
            return DbContext.Cases.Where(w => w.ClientId == id);
        }
    }

    public interface ICaseRepository<T> : IRepository<T>
         where T : class
    {

        IEnumerable<Case> GetByAdvocateId(long p);

        IEnumerable<Case> GetByClientId(long p);
    }

}