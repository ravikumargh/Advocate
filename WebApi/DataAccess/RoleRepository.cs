﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using WebApi.Models;

namespace WebApi.DataAccess
{
    public class RoleRepository : RepositoryBase, IRoleRepository
    {
         
        public void Add(Role entity)
        {
            DbContext.Roles.Add(entity);
            DbContext.SaveChanges();
        }

        public void Update(Role entity)
        {
            Role role = GetById(entity.Id);
            role.Name = entity.Name;
            DbContext.SaveChanges();
        }

        public void Delete(long id)
        {
            Role role = GetById(id);
            DbContext.Roles.Remove(role);
            DbContext.SaveChanges();
        }

        public void Delete(Expression<Func<Role, bool>> where)
        {
            Role role = Get(where);
            DbContext.Roles.Remove(role);
            DbContext.SaveChanges();
        }

        public Role GetById(long id)
        {
            return DbContext.Roles.Where(w => w.Id == id).FirstOrDefault();

        }

        public Role Get(Expression<Func<Role, bool>> where)
        {
            return DbContext.Roles.Where(where).FirstOrDefault<Role>();

        }

        public IEnumerable<Role> GetAll()
        {
            return DbContext.Roles.ToList();
        }

        public IEnumerable<Role> GetMany(Expression<Func<Role, bool>> where)
        {
            return DbContext.Roles.Where(where).ToList();

        }
    }

    public interface IRoleRepository : IRepository<Role>
    {

    }

}