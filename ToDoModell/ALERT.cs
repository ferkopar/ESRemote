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
    
    public partial class ALERT
    {
        public ALERT()
        {
            this.ALERT_PARAM = new HashSet<ALERT_PARAM>();
        }
    
        public long ALERT_ID { get; set; }
        public Nullable<long> ALERT_TYPE_ID { get; set; }
        public Nullable<long> MESSAGE_ID { get; set; }
        public string ALERT_STATUS { get; set; }
        public Nullable<long> EPI_ID { get; set; }
        public string U_COMMENT { get; set; }
        public Nullable<System.DateTime> TO_DATE { get; set; }
        public Nullable<short> PRIORITY { get; set; }
        public string CRU { get; set; }
        public Nullable<System.DateTime> CRD { get; set; }
        public string MDU { get; set; }
        public Nullable<System.DateTime> MDD { get; set; }
        public Nullable<long> STATUS_ID { get; set; }
        public Nullable<long> SUBJ_ID { get; set; }
        public string DESCRIPTION { get; set; }
        public Nullable<long> SUBJ_TYPE_ID { get; set; }
        public Nullable<long> OFFICE_ID { get; set; }
    
        public virtual ICollection<ALERT_PARAM> ALERT_PARAM { get; set; }
    }
}
