--------------------------------------------------------
--  DDL for Package Body DM_XL_TAPI
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "DM_XL_TAPI" 
IS
  -- insert
PROCEDURE ins(
    p_INC_TYPE_ID             IN DM_XL.INC_TYPE_ID%type DEFAULT NULL ,
    p_ORDER_REG               IN DM_XL.ORDER_REG%type DEFAULT NULL ,
    p_PARAM_FDATE             IN DM_XL.PARAM_FDATE%type DEFAULT NULL ,
    p_PARAM_UNIT              IN DM_XL.PARAM_UNIT%type DEFAULT NULL ,
    p_ORDER_SIGN              IN DM_XL.ORDER_SIGN%type DEFAULT NULL ,
    p_PARAM_TDATE             IN DM_XL.PARAM_TDATE%type DEFAULT NULL ,
    p_PARAM_TYPE_ID           IN DM_XL.PARAM_TYPE_ID%type DEFAULT NULL ,
    p_PARAM_DATE_TYPE_ID      IN DM_XL.PARAM_DATE_TYPE_ID%type DEFAULT NULL ,
    p_LEAD_TYPE_ID            IN DM_XL.LEAD_TYPE_ID%type DEFAULT NULL ,
    p_DESCRIPTION             IN DM_XL.DESCRIPTION%type DEFAULT NULL ,
    p_PARAM_D2VALUE           IN DM_XL.PARAM_D2VALUE%type DEFAULT NULL ,
    p_PARAM_ADATE_TYPE_ID     IN DM_XL.PARAM_ADATE_TYPE_ID%type DEFAULT NULL ,
    p_DATA_OWNER_ID           IN DM_XL.DATA_OWNER_ID%type DEFAULT NULL ,
    p_ORDER_NO                IN DM_XL.ORDER_NO%type DEFAULT NULL ,
    p_PARAM_UNIT_ID           IN DM_XL.PARAM_UNIT_ID%type DEFAULT NULL ,
    p_REL_TYPE_ID             IN DM_XL.REL_TYPE_ID%type DEFAULT NULL ,
    p_MUTABLE                 IN DM_XL.MUTABLE%type DEFAULT NULL ,
    p_PRINT_TYPE              IN DM_XL.PRINT_TYPE%type DEFAULT NULL ,
    p_SHEET_NAME              IN DM_XL.SHEET_NAME%type DEFAULT NULL ,
    p_PARAM_D1VALUE           IN DM_XL.PARAM_D1VALUE%type DEFAULT NULL ,
    p_DM_XL_ID                IN DM_XL.DM_XL_ID%type ,
    p_LIST_TYPE_ID            IN DM_XL.LIST_TYPE_ID%type DEFAULT NULL )
IS
BEGIN
  INSERT
  INTO DM_XL
    (
      
      INC_TYPE_ID ,   
      ORDER_REG ,
      PARAM_FDATE ,
      PARAM_UNIT ,
      ORDER_SIGN ,
      PARAM_TDATE ,
      W_REL_TYPE_NAME ,
      W_LIST_TYPE_NAME ,
      PARAM_TYPE_ID ,
      PARAM_DATE_TYPE_ID ,
      W_LEAD_TYPE_NAME ,
      LEAD_TYPE_ID ,
      DESCRIPTION ,
      PARAM_D2VALUE ,
      PARAM_ADATE_TYPE_ID ,
      DATA_OWNER_ID ,
      ORDER_NO ,
      W_PARAM_DATE_TYPE_NAME ,
      PARAM_UNIT_ID ,
      W_PARAM_TYPE_NAME ,
      REL_TYPE_ID ,    
      W_INC_TYPE_NAME ,
      MUTABLE ,
      PRINT_TYPE ,
      W_PARAM_ADATE_TYPE_NAME ,
      SHEET_NAME ,
      PARAM_D1VALUE ,
      DM_XL_ID ,
      LIST_TYPE_ID
    )
    VALUES
    (
      p_INC_TYPE_ID ,
      p_ORDER_REG ,
      p_PARAM_FDATE ,
      p_PARAM_UNIT ,
      p_ORDER_SIGN ,
      p_PARAM_TDATE ,
      LOOKUP_SUPER_TYPE_NAME( p_REL_TYPE_ID ) ,
      LOOKUP_SUPER_TYPE_NAME( p_LIST_TYPE_ID ) ,
      p_PARAM_TYPE_ID ,
      p_PARAM_DATE_TYPE_ID ,
      LOOKUP_SUPER_TYPE_NAME( p_LEAD_TYPE_ID ) ,
      p_LEAD_TYPE_ID ,
      p_DESCRIPTION ,
      p_PARAM_D2VALUE ,
      p_PARAM_ADATE_TYPE_ID ,
      p_DATA_OWNER_ID ,
      p_ORDER_NO ,
      LOOKUP_SUPER_TYPE_NAME( p_PARAM_DATE_TYPE_ID ) ,
      p_PARAM_UNIT_ID ,
      LOOKUP_SUPER_TYPE_NAME( p_PARAM_TYPE_ID ),
      p_REL_TYPE_ID ,
      LOOKUP_SUPER_TYPE_NAME( p_INC_TYPE_ID ),
      p_MUTABLE ,
      p_PRINT_TYPE ,
      LOOKUP_SUPER_TYPE_NAME( p_PARAM_ADATE_TYPE_ID ) ,
      p_SHEET_NAME ,
      p_PARAM_D1VALUE ,
      p_DM_XL_ID ,
      p_LIST_TYPE_ID
    );
END;
-- update
PROCEDURE upd
  (
    p_INC_TYPE_ID             IN DM_XL.INC_TYPE_ID%type DEFAULT NULL ,    
    p_ORDER_REG               IN DM_XL.ORDER_REG%type DEFAULT NULL ,
    p_PARAM_FDATE             IN DM_XL.PARAM_FDATE%type DEFAULT NULL ,
    p_PARAM_UNIT              IN DM_XL.PARAM_UNIT%type DEFAULT NULL ,
    p_ORDER_SIGN              IN DM_XL.ORDER_SIGN%type DEFAULT NULL ,
    p_PARAM_TDATE             IN DM_XL.PARAM_TDATE%type DEFAULT NULL ,
    p_PARAM_TYPE_ID           IN DM_XL.PARAM_TYPE_ID%type DEFAULT NULL ,
    p_PARAM_DATE_TYPE_ID      IN DM_XL.PARAM_DATE_TYPE_ID%type DEFAULT NULL ,
    p_LEAD_TYPE_ID            IN DM_XL.LEAD_TYPE_ID%type DEFAULT NULL ,
    p_DESCRIPTION             IN DM_XL.DESCRIPTION%type DEFAULT NULL ,
    p_PARAM_D2VALUE           IN DM_XL.PARAM_D2VALUE%type DEFAULT NULL ,
    p_PARAM_ADATE_TYPE_ID     IN DM_XL.PARAM_ADATE_TYPE_ID%type DEFAULT NULL ,
    p_DATA_OWNER_ID           IN DM_XL.DATA_OWNER_ID%type DEFAULT NULL ,
    p_ORDER_NO                IN DM_XL.ORDER_NO%type DEFAULT NULL ,
    p_PARAM_UNIT_ID           IN DM_XL.PARAM_UNIT_ID%type DEFAULT NULL ,
    p_REL_TYPE_ID             IN DM_XL.REL_TYPE_ID%type DEFAULT NULL ,
    p_MUTABLE                 IN DM_XL.MUTABLE%type DEFAULT NULL ,
    p_PRINT_TYPE              IN DM_XL.PRINT_TYPE%type DEFAULT NULL ,
    p_SHEET_NAME              IN DM_XL.SHEET_NAME%type DEFAULT NULL ,
    p_PARAM_D1VALUE           IN DM_XL.PARAM_D1VALUE%type DEFAULT NULL ,
    p_DM_XL_ID                IN DM_XL.DM_XL_ID%type ,
    p_LIST_TYPE_ID            IN DM_XL.LIST_TYPE_ID%type DEFAULT NULL
  )
IS
  v_dm_xl_row DM_XL%ROWTYPE;
  v_order_no DM_XL.ORDER_NO%TYPE;
  CURSOR orders IS
    SELECT DM_XL_ID,ORDER_NO from DM_XL
      where LIST_TYPE_ID =  p_list_type_id
      and   REL_TYPE_ID = p_rel_type_id
    order by ORDER_NO DESC;
BEGIN
  SELECT * INTO v_dm_xl_row FROM DM_XL WHERE DM_XL_ID = p_DM_XL_ID;
  if p_ORDER_NO is not null and p_ORDER_NO = v_dm_xl_row.order_no then
    v_order_no := p_ORDER_NO;
  elsif p_order_no is null then
    v_order_no := v_dm_xl_row.order_no;
  else
    for o in orders
      loop
         if o.order_no >= p_ORDER_NO then
            update dm_xl set order_no = order_no + 1 where o.dm_xl_id = dm_xl_id;
         end if;
      end loop;
     v_order_no := p_ORDER_NO;
  end if;
  UPDATE DM_XL
  SET 
    INC_TYPE_ID             = nvl(p_INC_TYPE_ID,v_dm_xl_row.INC_TYPE_ID) ,
    ORDER_REG               = nvl(p_ORDER_REG,v_dm_xl_row.ORDER_REG) ,
    PARAM_FDATE             = nvl(p_PARAM_FDATE,v_dm_xl_row.PARAM_FDATE) ,
    PARAM_UNIT              = nvl(p_PARAM_UNIT,v_dm_xl_row.PARAM_UNIT) ,
    ORDER_SIGN              = nvl(p_ORDER_SIGN,v_dm_xl_row.ORDER_SIGN) ,
    PARAM_TDATE             = nvl(p_PARAM_TDATE,v_dm_xl_row.PARAM_TDATE),
    W_REL_TYPE_NAME         = nvl2(p_REL_TYPE_ID,LOOKUP_SUPER_TYPE_NAME( p_REL_TYPE_ID ),v_dm_xl_row.W_REL_TYPE_NAME),
    W_LIST_TYPE_NAME        = nvl2(p_LIST_TYPE_ID,LOOKUP_SUPER_TYPE_NAME( p_LIST_TYPE_ID ),v_dm_xl_row.W_LIST_TYPE_NAME) ,
    PARAM_TYPE_ID           = nvl(p_PARAM_TYPE_ID,v_dm_xl_row.PARAM_TYPE_ID) ,
    PARAM_DATE_TYPE_ID      = nvl(p_PARAM_DATE_TYPE_ID,v_dm_xl_row.PARAM_DATE_TYPE_ID) ,
    W_LEAD_TYPE_NAME        = nvl2(p_LEAD_TYPE_ID,LOOKUP_SUPER_TYPE_NAME( p_LEAD_TYPE_ID ),v_dm_xl_row.W_LEAD_TYPE_NAME) ,
    LEAD_TYPE_ID            = nvl(p_LEAD_TYPE_ID,v_dm_xl_row.LEAD_TYPE_ID) ,
    DESCRIPTION             = nvl(p_DESCRIPTION,v_dm_xl_row.DESCRIPTION) ,
    PARAM_D2VALUE           = nvl(p_PARAM_D2VALUE,v_dm_xl_row.PARAM_D2VALUE) ,
    PARAM_ADATE_TYPE_ID     = nvl(p_PARAM_ADATE_TYPE_ID,v_dm_xl_row.PARAM_ADATE_TYPE_ID) ,
    DATA_OWNER_ID           = nvl(p_DATA_OWNER_ID,v_dm_xl_row.DATA_OWNER_ID) ,
 --   ORDER_NO                = nvl(p_ORDER_NO,v_dm_xl_row.ORDER_NO) ,
    ORDER_NO                = v_order_no,
    W_PARAM_DATE_TYPE_NAME  = nvl2(p_PARAM_DATE_TYPE_ID,LOOKUP_SUPER_TYPE_NAME( p_PARAM_DATE_TYPE_ID),v_dm_xl_row.W_PARAM_DATE_TYPE_NAME) ,
    PARAM_UNIT_ID           = nvl(p_PARAM_UNIT_ID,v_dm_xl_row.PARAM_UNIT_ID)  ,
    W_PARAM_TYPE_NAME       = nvl2(p_PARAM_TYPE_ID,LOOKUP_SUPER_TYPE_NAME( p_PARAM_TYPE_ID ),v_dm_xl_row.W_PARAM_TYPE_NAME) ,
    REL_TYPE_ID             = nvl(p_REL_TYPE_ID,v_dm_xl_row.REL_TYPE_ID) ,
    W_INC_TYPE_NAME         = nvl2(p_INC_TYPE_ID,LOOKUP_SUPER_TYPE_NAME( p_INC_TYPE_ID ),v_dm_xl_row.W_INC_TYPE_NAME),
    MUTABLE                 = nvl(p_MUTABLE,v_dm_xl_row.MUTABLE) ,
    PRINT_TYPE              = nvl(p_PRINT_TYPE,v_dm_xl_row.PRINT_TYPE) ,
    W_PARAM_ADATE_TYPE_NAME = nvl2(p_PARAM_ADATE_TYPE_ID,LOOKUP_SUPER_TYPE_NAME( p_PARAM_ADATE_TYPE_ID ),v_dm_xl_row.W_PARAM_ADATE_TYPE_NAME),
    SHEET_NAME              = nvl(p_SHEET_NAME,v_dm_xl_row.SHEET_NAME) ,
    PARAM_D1VALUE           = nvl(p_PARAM_D1VALUE,v_dm_xl_row.PARAM_D1VALUE) ,
    LIST_TYPE_ID            = nvl(p_LIST_TYPE_ID, v_dm_xl_row.LIST_TYPE_ID)
  WHERE DM_XL_ID            = p_DM_XL_ID;
END;
-- del
PROCEDURE del(
    p_DM_XL_ID IN DM_XL.DM_XL_ID%type )
IS
BEGIN
  --delete from wk_pf_audit_table;
  --INSERT into wk_pf_audit_table values('p_DM_XL_ID',p_DM_XL_ID);
  --INSERT into wk_pf_audit_table values('p_DM_XL_ID_DST',p_DM_XL_ID_DST);
  DELETE FROM DM_XL WHERE DM_XL_ID = p_DM_XL_ID;
END;


PROCEDURE add(p_DM_XL_ID_SRC IN DM_XL.DM_XL_ID%type,
                p_DM_XL_ID_DST IN DM_XL.DM_XL_ID%type  DEFAULT NULL,
                p_LIST_TYPE_ID IN DM_XL.LIST_TYPE_ID%type  DEFAULT NULL)
IS 
v_DM_XL_ID_DST DM_XL.DM_XL_ID%type;
row DM_XL%rowtype;
BEGIN
--  delete from wk_pf_audit_table;
--  INSERT into wk_pf_audit_table values('p_DM_XL_ID_SRC',p_DM_XL_ID_SRC);
--  INSERT into wk_pf_audit_table values('p_DM_XL_ID_DST',p_DM_XL_ID_DST);

  IF p_DM_XL_ID_DST = NULL THEN
    select SEQ_BASE.NEXTVAL INTO v_DM_XL_ID_DST FROM DUAL;
  ELSE
    v_DM_XL_ID_DST := p_DM_XL_ID_DST; 
  END IF;
  BEGIN
     SELECT * INTO row FROM DM_XL WHERE DM_XL_ID = p_DM_XL_ID_SRC;
  EXCEPTION
    WHEN OTHERS THEN 
     SELECT * INTO row FROM DM_XL WHERE DM_XL_ID = 1;
  END;
  ins(
                         p_INC_TYPE_ID             => row.INC_TYPE_ID,
                         p_ORDER_REG               => row.ORDER_REG,
                         --p_PARAM_FDATE             => date_util_pkg.tomorow_zero ,
                         p_PARAM_FDATE             => row.PARAM_FDATE,
                         p_PARAM_UNIT              => row.PARAM_UNIT,
                         p_ORDER_SIGN              => row.ORDER_SIGN,
                         --p_PARAM_TDATE             => date_util_pkg.close_day ,
                         p_PARAM_TDATE             => row.PARAM_TDATE ,
                         p_PARAM_TYPE_ID           => row.PARAM_TYPE_ID,
                         p_PARAM_DATE_TYPE_ID      => row.PARAM_DATE_TYPE_ID,
                         p_LEAD_TYPE_ID            => row.LEAD_TYPE_ID,
                         p_DESCRIPTION             => 'COPY of '|| row.DESCRIPTION,
                         p_PARAM_D2VALUE           => row.PARAM_D2VALUE,
                         p_PARAM_ADATE_TYPE_ID     => row.PARAM_ADATE_TYPE_ID,
                         p_DATA_OWNER_ID           => row.DATA_OWNER_ID,
                         p_ORDER_NO                => max_order_no(row.LIST_TYPE_ID,row.REL_TYPE_ID)+1,
                         p_PARAM_UNIT_ID           => row.PARAM_UNIT_ID,
                         p_REL_TYPE_ID             => row.REL_TYPE_ID,
                         p_MUTABLE                 => row.MUTABLE,
                         p_PRINT_TYPE              => row.PRINT_TYPE ,
                         p_SHEET_NAME              => row.SHEET_NAME ,
                         p_PARAM_D1VALUE           => row.PARAM_D1VALUE,
                         p_DM_XL_ID                => v_DM_XL_ID_DST,
                         p_LIST_TYPE_ID            => nvl(p_LIST_TYPE_ID,row.LIST_TYPE_ID) ); 
END;

  FUNCTION max_order_no(p_list_type_id DM_XL.LIST_TYPE_ID%TYPE,
                        p_rel_type_id  DM_XL.REL_TYPE_ID%TYPE) 
    return DM_XL.ORDER_NO%TYPE
  IS
   v_ret_val DM_XL.ORDER_NO%TYPE;
  BEGIN
  SELECT max(ORDER_NO) into v_ret_val from DM_XL
      where LIST_TYPE_ID =  p_list_type_id
      and   REL_TYPE_ID = p_rel_type_id;
    return v_ret_val;   
  END;
END DM_XL_tapi;

/
