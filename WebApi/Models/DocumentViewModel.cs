using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApi.Models
{
    public class DocumentViewModel
    {
        public string data { get; set; }
        public string name { get; set; }
        public int size { get; set; }
        public string type { get; set; }
        //public System.Web.HttpPostedFile file { get; set; }

        public string Description { get; set; }

        public long? UserId { get; set; }

        public long? DocumentType { get; set; }
    }
}