//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApi.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Image
    {
        public long Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Nullable<long> ContentType { get; set; }
        public byte[] Content { get; set; }
        public Nullable<long> UserId { get; set; }
        public Nullable<bool> IsDeleted { get; set; }
        public Nullable<System.DateTime> DateCreated { get; set; }
        public Nullable<System.DateTime> DateUpdated { get; set; }
    
        public virtual ContentType ContentType1 { get; set; }
        public virtual User User { get; set; }
    }
}