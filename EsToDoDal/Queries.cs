using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EsToDoDal
{
    public static class Queries
    {
        public static List<DM_SUPER_TYP> GetMainSuperTypeItems()
        {
            var retVal = new List<DM_SUPER_TYP>();
            using (var ctx = new ToDoEntities())
            {
                var superTypes = (from superType in ctx.DM_SUPER_TYP
                                  where superType.SUPER_TYP_ID == superType.GROUND_LEVEL_ID
                                  select superType);
                foreach (var superType in superTypes)
                {
                    retVal.Add(superType);
                }
            }
            return retVal;
        }
    }
}
