//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace ToDoModell
{
    using System;
    using System.Collections.Generic;
    
    public partial class DM_SUPER_TYP
    {
        public DM_SUPER_TYP()
        {
            this.DM_SUPER_TYP1 = new HashSet<DM_SUPER_TYP>();
            this.DM_TREATM = new HashSet<DM_TREATM>();
            this.DM_TREATM1 = new HashSet<DM_TREATM>();
            this.TREATMs = new HashSet<TREATM>();
            this.TREATMs1 = new HashSet<TREATM>();
            this.TREATMs2 = new HashSet<TREATM>();
        }
    
        public long SUPER_TYP_ID { get; set; }
        public Nullable<long> GROUP_ID { get; set; }
        public long GROUND_LEVEL_ID { get; set; }
        public string SUPER_TYPE_NAME { get; set; }
        public string SUPER_TYPE_SHORT_NAME { get; set; }
        public string SUPER_GROUP_NAME { get; set; }
        public Nullable<short> SLEVEL { get; set; }
        public Nullable<long> WK_CLASS_ID { get; set; }
        public System.DateTime FROM_DATE { get; set; }
        public System.DateTime TO_DATE { get; set; }
        public string DESCRIPTION { get; set; }
        public string USE_COMMENT { get; set; }
        public string CRU { get; set; }
        public Nullable<System.DateTime> CRD { get; set; }
        public string MDU { get; set; }
        public Nullable<System.DateTime> MDD { get; set; }
        public Nullable<short> ROLL_TYPE { get; set; }
        public string WIRED_TO { get; set; }
    
        public virtual ICollection<DM_SUPER_TYP> DM_SUPER_TYP1 { get; set; }
        public virtual DM_SUPER_TYP DM_SUPER_TYP2 { get; set; }
        public virtual ICollection<DM_TREATM> DM_TREATM { get; set; }
        public virtual ICollection<DM_TREATM> DM_TREATM1 { get; set; }
        public virtual ICollection<TREATM> TREATMs { get; set; }
        public virtual ICollection<TREATM> TREATMs1 { get; set; }
        public virtual ICollection<TREATM> TREATMs2 { get; set; }
    }
}