using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using WebApi.Models;

namespace WebApi.DataAccess
{
    public class UserRepository : RepositoryBase, IUserRepository
    {
         
        public void Add(User entity)
        {
            DbContext.Users.Add(entity);
            DbContext.SaveChanges();
        }

        public void Update(User entity)
        {
            User user = GetById(entity.Id);
            user.Name = entity.Name;
            DbContext.SaveChanges();
        }

        public void Delete(long id)
        {
            User user = GetById(id);
            DbContext.Users.Remove(user);
            DbContext.SaveChanges();
        }

        public void Delete(Expression<Func<User, bool>> where)
        {
            User user = Get(where);
            DbContext.Users.Remove(user);
            DbContext.SaveChanges();
        }

        public User GetById(long id)
        {
            return DbContext.Users.Where(w => w.Id == id).FirstOrDefault();

        }

        public User Get(Expression<Func<User, bool>> where)
        {
            return DbContext.Users.Where(where).FirstOrDefault<User>();

        }

        public IEnumerable<User> GetAll()
        {
            return DbContext.Users.ToList();
        }

        public IEnumerable<User> GetMany(Expression<Func<User, bool>> where)
        {
            return DbContext.Users.Where(where).ToList();

        }
    }

    public interface IUserRepository : IRepository<User>
    {

    }

}