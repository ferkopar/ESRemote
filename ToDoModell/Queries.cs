using System;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Data;
using System.Data.EntityClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Oracle.DataAccess.Client;

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

        public static List<string> proba()
        {
            List<string> list = new List<string>();
            string sqlQuery = "select treatm_name from TREATM";
            using (var e = new EsToDoEntities())
            {
                var conn = e.Database.Connection;
                conn.Open();
                var schema = conn.GetSchema("columns");

                DisplayData(schema);
                Console.WriteLine("Press any key to continue.");
                Console.ReadKey();
                
                //var cmd = conn.CreateCommand();
                //cmd.CommandText = sqlQuery;
                //var reader = cmd.ExecuteReader();
               
                //while (reader.Read())
                //{

                //    list.Add(reader.GetString(reader.GetOrdinal("treatm_name")));
                //}
                //conn.Close();
                return list;
            }
        }

        private static void DisplayData(System.Data.DataTable table)
        {
            foreach (System.Data.DataRow row in table.Rows)
            {
                foreach (System.Data.DataColumn col in table.Columns)
                {
                    Console.WriteLine("{0} = {1}", col.ColumnName, row[col]);
                }
                Console.WriteLine("============================");
            }
        }

        public static List<string> ShowSchema()
        {
            string sqlQuery = "select t.treatm_name from EsToDoEntities.TREATMs as t";
            //string esql = "select e.EMPLOYEE_ID, e.FIRST_NAME, e.SALARY from HREntities.EMPLOYEEs as e where e.EMPLOYEE_ID < " + max_id;

            List<string> list = new List<string>();
            EntityConnection econn = new EntityConnection("name=EsToDoEntities");

            econn.Open();
            EntityCommand ecmd = econn.CreateCommand();
            ecmd.CommandText = sqlQuery;
            EntityDataReader ereader = ecmd.ExecuteReader(CommandBehavior.SequentialAccess);

            Console.WriteLine("Entity SQL Result");
            while (ereader.Read())
            {
                list.Add(ereader.GetString(0));
            }
          
            return list;

        }
    }
}
