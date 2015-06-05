using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ToDoModell;

namespace ToDoModellView
{
    public class DmSuperTyp
    {
        private ObservableCollection<DmSuperTyp> _child;
        private DM_SUPER_TYP t;

        

        public long SuperTypId { get; set; }
        public Nullable<long> GroupId { get; set; }
        public long GroundLevelId { get; set; }
        public string SuperTypeName { get; set; }
        public string SuperTypeSortName { get; set; }
        public string SuperGroupName { get; set; }
        public Nullable<short> Slevel { get; set; }
        public System.DateTime FromDate { get; set; }
        public System.DateTime ToDate { get; set; }
        public string Description { get; set; }
        public string UseComment { get; set; }
        public Nullable<short> RollType { get; set; }
        public string WiredTo { get; set; }

        public DmSuperTyp(){}
        public DmSuperTyp(DM_SUPER_TYP t)
        {
            SuperTypId = t.SUPER_TYP_ID;
            GroupId = t.GROUP_ID;
            GroundLevelId = t.GROUND_LEVEL_ID;
            SuperTypeName = t.SUPER_TYPE_NAME;
            SuperTypeSortName = t.SUPER_TYPE_SHORT_NAME;
            SuperGroupName = t.SUPER_GROUP_NAME;
            Slevel = t.SLEVEL;
            FromDate = t.FROM_DATE;
            ToDate = t.TO_DATE;
            Description = t.DESCRIPTION;
            UseComment = t.USE_COMMENT;
            RollType = t.ROLL_TYPE;
            WiredTo = t.WIRED_TO;
        }

        public DmSuperTyp Parent { get; set; }
        public ObservableCollection<DmSuperTyp> Childs
        {
            get
            {
                if (_child == null)
                {
                    _child = new ObservableCollection<DmSuperTyp>();
                    _child.CollectionChanged += new NotifyCollectionChangedEventHandler(OnChildsChanged);
                }

                return _child;
            }
        }

        private void OnChildsChanged(object sender, NotifyCollectionChangedEventArgs e)
        {
            // Note: This section does not account for multiple items being involved in change operations.
            // Note: This section does not account for the replace operation.
            if (e.Action == NotifyCollectionChangedAction.Add)
            {
                DmSuperTyp superTyp = (DmSuperTyp)e.NewItems[0];
                superTyp.Parent = this;
            }
            else if (e.Action == NotifyCollectionChangedAction.Remove)
            {
                DmSuperTyp superTyp = (DmSuperTyp)e.OldItems[0];
                if (superTyp.Parent == this)
                {
                    superTyp.Parent = null;
                }
            }
        }

        public static implicit operator DmSuperTyp(DM_SUPER_TYP t)
        {
            return new DmSuperTyp(t);
        }

        public static ObservableCollection<DmSuperTyp> GetGroudLevel()
        {
            var superTypes = Queries.GroundLevelTypes();
            var retVal = new ObservableCollection<DmSuperTyp>();
            foreach (var superType in superTypes)
            {
                retVal.Add(superType);
            }
            return retVal;
        }

        public void RetrieveChilds()
        {
            var superTypes = Queries.ChildList(SuperTypId);
            foreach (var superType in superTypes)
            {
                if (!this.Childs.Any(p => p.SuperTypId == superType.SUPER_TYP_ID))
                {
                    DmSuperTyp child = superType;
                    child.Parent = this;
                    Childs.Add(child);
                }
            }
        }

        public void Move(DmSuperTyp targetSuperTyp)
        {
            if (Parent != null)
                Parent.Childs.Remove(this);
            targetSuperTyp.Childs.Add(this);
            GroupId = targetSuperTyp.SuperTypId;
        }

        public override string ToString()
        {
            return string.Format("{0} ({1})", SuperTypeName, SuperTypId);
        }
    }
}
