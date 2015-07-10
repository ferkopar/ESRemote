using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ToDoModell
{
    class Table
    {
        public string TABLE_NAME { get; set; }
        public string OWNER { get; set; }
        public List<Column> Columns { get; set; }
    }
}
