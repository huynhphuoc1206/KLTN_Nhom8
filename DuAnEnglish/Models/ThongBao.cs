//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DuAnEnglish.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ThongBao
    {
        public int IDThongBao { get; set; }
        public string IDNguoiGui { get; set; }
        public string IDNguoiNhan { get; set; }
        public string TieuDe { get; set; }
        public string NoiDung { get; set; }
        public Nullable<System.DateTime> NgayGui { get; set; }
    
        public virtual TaiKhoan TaiKhoan { get; set; }
        public virtual TaiKhoan TaiKhoan1 { get; set; }
    }
}
