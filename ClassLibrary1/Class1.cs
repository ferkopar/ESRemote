using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary1
{
    public static class Class1
    {
        public static List<DM_SUPER_TYP> xxxx()
        {
            using (var x = new Entities())
            {
               return x.DM_SUPER_TYP.Where(p=>p.GROUP_ID == null).ToList();
            }
        }
    }
    
}
