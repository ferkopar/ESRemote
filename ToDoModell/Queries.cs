using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToDoModell
{
    public static class Queries
    {

        public static List<DM_SUPER_TYP> GroundLevelTypes()
        {
            using (var e = new EsToDoEntities())
            {
                return e.DM_SUPER_TYP.Where(p => p.GROUP_ID == null).ToList();
            }
        }

        public static List<DM_SUPER_TYP> ChildList(long superGroupId)
        {
            using (var e = new EsToDoEntities())
            {
                return e.DM_SUPER_TYP.Where(p => p.GROUP_ID == superGroupId).ToList();
            }
        }
    }
}
