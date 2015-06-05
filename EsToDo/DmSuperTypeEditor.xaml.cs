using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ToDoModellView;

namespace EsToDo
{
    /// <summary>
    /// Interaction logic for DmSuperTypeEditor.xaml
    /// </summary>
    public partial class DmSuperTypeEditor : UserControl
    {
        private DmSuperTyp _superType;
        public DmSuperTyp SuperType {
            get { return _superType; }
            set 
            { 
                _superType = value;
                EditorGrid.DataContext = _superType;
            } 
        }

        public long SuperTypeId
        {
            get
            {
                if (SuperType != null)
                {
                    return SuperType.SuperTypId;
                }
                return 0;
            }
        }

        public DmSuperTypeEditor()
        {
            InitializeComponent();
        }
    }
}
