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
    
    public partial class TREATM
    {
        public TREATM()
        {
            this.TREATM_PARAM = new HashSet<TREATM_PARAM>();
        }
    
        public long TREATM_ID { get; set; }
        public string TREATM_NAME { get; set; }
        public Nullable<long> TREATM_GROUP_ID { get; set; }
        public Nullable<long> TREATM_TYPE_ID { get; set; }
        public Nullable<long> STATUS_ID { get; set; }
        public Nullable<long> TREATM_CATEGORY_ID { get; set; }
        public Nullable<long> MM_ID { get; set; }
        public Nullable<System.DateTime> TIME_START { get; set; }
        public Nullable<System.DateTime> TIME_END { get; set; }
        public Nullable<long> SUBJ1_ID { get; set; }
        public Nullable<long> TYPE1_ID { get; set; }
        public Nullable<long> SUBJ2_ID { get; set; }
        public Nullable<long> TYPE2_ID { get; set; }
        public string DESCRIPTION { get; set; }
        public string CRU { get; set; }
        public Nullable<System.DateTime> CRD { get; set; }
        public Nullable<System.DateTime> MDD { get; set; }
        public string MDU { get; set; }
        public System.DateTime FROM_DATE { get; set; }
        public System.DateTime TO_DATE { get; set; }
        public Nullable<long> TREATM_NAME_ID { get; set; }
    
        public virtual DM_SUPER_TYP DM_SUPER_TYP { get; set; }
        public virtual DM_SUPER_TYP DM_SUPER_TYP1 { get; set; }
        public virtual DM_SUPER_TYP DM_SUPER_TYP2 { get; set; }
        public virtual ICollection<TREATM_PARAM> TREATM_PARAM { get; set; }
    }
}