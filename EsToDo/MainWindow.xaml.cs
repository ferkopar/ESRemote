using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private Point _lastMouseDown;
        private ObservableCollection<DmSuperTyp> _superTypes;
        private DmSuperTyp _targetSuperType;

        public ObservableCollection<DmSuperTyp> SuperTypes
        {
            get
            {
                if (_superTypes == null)
                {
                   _superTypes =  DmSuperTyp.GetGroudLevel();
                }

                return _superTypes;
            }
        }
        
        public MainWindow()
        {
            InitializeComponent();
        }

        void SuperTypeTree_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            var source = (e.Source as TreeViewItem).Header as DmSuperTyp;
            source.RetrieveChilds();         
        }

        private void SuperTypeTree_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.ChangedButton == MouseButton.Left)
            {
                _lastMouseDown = e.GetPosition(SuperTypeTree);
            }
        }

        private void SuperTypeTree_MouseMove(object sender, MouseEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
            {
                Point currentPosition = e.GetPosition(SuperTypeTree);

                // Note: This should be based on some accessibility number and not just 2 pixels
                if ((Math.Abs(currentPosition.X - _lastMouseDown.X) > 2.0) ||
                    (Math.Abs(currentPosition.Y - _lastMouseDown.Y) > 2.0))
                {
                    var selectedItem = (DmSuperTyp) SuperTypeTree.SelectedItem;
                     {
                         TreeViewItem container = GetContainerFromSuperType(selectedItem);
                         if (container != null)
                         {
                             DragDropEffects finalDropEffect = DragDrop.DoDragDrop(container, selectedItem, DragDropEffects.Move);
                             if ((finalDropEffect == DragDropEffects.Move) && (_targetSuperType != null))
                             {
                                 // A Move drop was accepted
                                 selectedItem.Move(_targetSuperType);
                                 //selectedItem.Parent.Childs.Remove(selectedItem);
                                 //_targetSuperType.Childs.Add(selectedItem);
                                 _targetSuperType = null;
                             }
                         }
                    }
                }
            }
        }


        private TreeViewItem GetContainerFromSuperType(DmSuperTyp superType)
        {
            var _stack = new Stack<DmSuperTyp>();
            _stack.Push(superType);
            var parent = superType.Parent;

            while (parent != null)
            {
                _stack.Push(parent);
                parent = parent.Parent;
            }

            ItemsControl container = SuperTypeTree;
            while ((_stack.Count > 0) && (container != null))
            {
                var top = _stack.Pop();
                container = (ItemsControl)container.ItemContainerGenerator.ContainerFromItem(top);
            }

            return container as TreeViewItem;
        }

        private void SuperTypeTree_Drop(object sender, DragEventArgs e)
        {
            e.Effects = DragDropEffects.None;
            e.Handled = true;


            // Verify that this is a valid drop and then store the drop target
            TreeViewItem container = GetNearestContainer(e.OriginalSource as UIElement);
            if (container != null)
            {
                var sourceSuperType = (DmSuperTyp)e.Data.GetData(typeof(DmSuperTyp));
                var targetSuperType = (DmSuperTyp)container.Header;
                if ((sourceSuperType != null) && (targetSuperType != null))
                {
                    if (!targetSuperType.Childs.Contains(sourceSuperType))
                    {
                        _targetSuperType = targetSuperType;
                        e.Effects = DragDropEffects.Move;
                    }
                }
            }
        }

        private TreeViewItem GetNearestContainer(UIElement element)
        {
            // Walk up the element tree to the nearest tree view item.
            TreeViewItem container = element as TreeViewItem;
            while ((container == null) && (element != null))
            {
                element = VisualTreeHelper.GetParent(element) as UIElement;
                container = element as TreeViewItem;
            }

            return container;
        }

        private void TheTreeView_CheckDropTarget(object sender, DragEventArgs e)
        {
            if (!IsValidDropTarget(e.OriginalSource as UIElement))
            {
                e.Effects = DragDropEffects.None;
            }
            e.Handled = true;
        }

        private bool IsValidDropTarget(UIElement target)
        {
            if (target != null)
            {
                TreeViewItem container = GetNearestContainer(target);

                // Ensure that the target is one of the root items
                return ((container != null) && (((DmSuperTyp)container.Header).Parent == null));
            }

            return false;
        }

        private void SuperTypeTree_SelectedItemChanged(object sender, RoutedPropertyChangedEventArgs<object> e)
        {
            MyEditor.SuperType = (DmSuperTyp)e.NewValue;
        }

    }
}
