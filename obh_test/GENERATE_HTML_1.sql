--------------------------------------------------------
--  DDL for Package Body GENERATE_HTML
--------------------------------------------------------

  CREATE OR REPLACE PACKAGE BODY "GENERATE_HTML" AS 

  PROCEDURE GET_DOC_EDIT_HTML (
    p_treatm_id NUMBER 
  , p_lista_id  NUMBER DEFAULT NULL
  , p_doc_id    NUMBER 
  , p_editable  NUMBER DEFAULT NULL
  )
  AS
    cursor oszlopok(p_doc_id number) is
    select *
      from dm_xl 
      where 
          DM_XL.LIST_TYPE_ID = nvl(p_lista_id,GET_DOC_DEFAULT_LIST(p_doc_id)) and
          DM_XL.REL_TYPE_ID = 42
      order by order_no;

     CURSOR sorok(p_doc_id number) IS
     select *
     from dm_xl 
     where 
      DM_XL.LIST_TYPE_ID = nvl(p_lista_id,GET_DOC_DEFAULT_LIST(p_doc_id)) and
      DM_XL.REL_TYPE_ID IN (43,49)
     order by order_no;

    cursor listak(p_doc_id number) is 
            select SUPER_TYP_id,SUPER_TYPE_NAME from dm_super_typ 
              where  group_id = p_doc_id;
              --       (select GROUP_ID FROM DM_SUPER_TYP where SUPER_TYP_ID =GET_DOC_DEFAULT_LIST(p_lista_id)) ;
 
    v_column_max      number(3,0) := 0;
    v_row_cnt         number(3,0) := 0;
    v_table_width     number(5,0) := 1934;
    v_cell_value      VARCHAR2(2000);
    v_ize             number;
    v_treatm_id       number;
    v_doc_id          number;
   BEGIN    
    if p_treatm_id is null or p_treatm_id = 0 then
--      htp.p('---- null ---');
      select nvl( max(data_inco_id)+1,100) into v_treatm_id from tr_xl;
      APEX_UTIL.SET_SESSION_STATE('P6000_DATA_INCO_ID',v_treatm_id);
      v_doc_id := p_doc_id;
    ELSE
      htp.p('---- not null:'|| p_treatm_id ||' ---');
      v_treatm_id := p_treatm_id;
      v_doc_id := get_doc_id(v_treatm_id);
    end if;
    open sorok(v_doc_id);
--    htp.p('-rc-'||sorok%ROWCOUNT  || '---');
    close sorok;
--    htp.p('----'|| p_doc_id || '---');
--    htp.p('----'|| p_lista_id || '---');
--    htp.p( '<div id="tableContainer" class="tableContainer" style="height: 300px;">' );
    htp.p( '<div id="tableContainer" class="tableContainer">' );
    HTP.P('<div id="tabsF"><ul>'); 
    for lista in listak(v_doc_id)
    loop   
      if lista.SUPER_TYP_ID in (100131,100132,100142,100051,100052,100053,100101,100104,100121,100122) then
         HTP.P('<li><a href="f?p='||V('APP_ID')||':6000:'||V('APP_SESSION')||'::::P6000_LISTA_ID:'||lista.SUPER_TYP_ID ||'"><span>'||lista.SUPER_TYPE_NAME ||'</span></a></li>'); 
      end if;
    end loop;
    HTP.P('</ul></div>'); 
    if p_lista_id = 100131 then
       v_table_width := 500;
    end if;
    htp.p( '<table id="EloiranyzatTable" style="width:'||v_table_width ||'px">' ); 
    htp.p( '<thead class="fixedHeader">' );
    if nvl(p_lista_id,GET_DOC_DEFAULT_LIST(v_doc_id)) != 100131 then
      htp.p( '<tr><th style="overflow:hidden; width:40px;" onclick="insert_line(this)">Sor-<br>szám</th>' ); 
      for oszlop in oszlopok(v_doc_id)
      loop
        htp.p(  '<th style="overflow:hidden; width:125px;">' || nvl(oszlop.description,lookup_super_type_name(oszlop.PARAM_TYPE_ID)) || '</th>' );
        v_column_max := v_column_max + 1;
      end loop;
      htp.p( '</tr>');
    end if;
    htp.p(  '</thead>');
    htp.p(  '<tbody  class="scrollContent" style="vertical-align:top;">');
    
    FOR sor IN sorok(v_doc_id)
    LOOP
--      htp.p('----'|| sor.rel_type_id || '---');
    if sor.rel_type_id = 49 then
--      htp.p('----'|| sor.order_no || '---');
      if sor.order_no = '1..x' then    
--          htp.p('----'|| sor.order_no || '---');    
         get_detail_rows_html(v_treatm_id,nvl(p_lista_id,GET_DOC_DEFAULT_LIST(v_doc_id)));
      elsif sor.order_no = 'x+1' then null;
      else 
        raise_application_error(-20000, 'Érvénytelen order_no:' || sor.order_no );
      end if;
    else 
        if p_lista_id = 100131 then
           v_row_cnt := v_row_cnt + 1;
           htp.p('<tr>');
           htp.p( '<td style="overflow:hidden; width:40px;">'||v_row_cnt||'</td>' ); 
           htp.p('<td>'|| sor.w_param_type_name || '</td>');
           htp.p('<td>'); 
           begin
            select ORDER_NO1 into v_ize from v_dm_xl_rel 
              where REL_TYPE_ID = 96
              and   DM_XL_ID2 = sor.dm_xl_id;
           exception when others then
            v_ize := 0;
            v_cell_value := null;
           end;  
           if v_ize is not null then        
              v_cell_value := SUM_COL_VALUE(v_treatm_id,v_ize,nvl(p_lista_id,GET_DOC_DEFAULT_LIST(v_doc_id)),sor.order_no);
           end if;
           if sor.mutable = 1 then
           htp.p(  '<input type="text" onchange="insert_tr_xl(this,'||0||','||to_char(sor.param_type_id)||','||to_char(v_treatm_id));
                    htp.p(  ')"  onkeydown="showKeyCode(event);" size = "10" style = "text-align:right;"  class = "field" value="'); 
                    htp.p( to_char(v_cell_value) ||'">');
                    --htp.p( '&nbsp;">');
            else
            htp.p('<div id="cell_id_'|| 0 ||'" style="width=100px;">'|| v_cell_value || '</div>');
            end if;
           htp.p('</td>');
           htp.p('<tr>');
          else
            null;
        end if;
        --get_row_html( p_treatm_id,p_lista_id,sor.order_no) ;
    end if;  
    end loop;
    htp.p(  '</tbody>' );
    htp.p(  '</table>' ); 
    htp.p(  '</div>' );
    
   END GET_DOC_EDIT_HTML;

  FUNCTION GET_ROW_HTML(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_order_no DM_XL.ORDER_NO%TYPE
  , p_editable NUMBER DEFAULT NULL
  ) RETURN VARCHAR2 
  AS
  v_line_no number(3,0) := 0;
  v_cnt number (3,0);
  v_first_line boolean := true;
  v_first_column boolean := true;
  v_exists_status number(3,0) := 0;
  v_tr_xl_id number(12,0);
  v_cell_value varchar2(255);

  V_COUNTER number(3,0) := 0;
  v_status_counter number(3,0) := 0;

  v_column_no number(3,0) := 1;
  v_column_max number(3,0) := 0;
  v_comment_no NUMBER(3);

  v_old_param_type_id number(12,0) := -1;
  v_COLSPAN number(3,0) := 0;

  v_retval VARCHAR2 (32000) := ' ';

  sor DM_XL%ROWTYPE;

cursor oszlopok is
select *
  from dm_xl 
  where 
      DM_XL.LIST_TYPE_ID = p_lista_id and
      DM_XL.REL_TYPE_ID = 42
order by order_no;

begin

select * into sor from dm_xl 
  where 
      DM_XL.LIST_TYPE_ID = p_lista_id and
      DM_XL.REL_TYPE_ID = 43 AND
      DM_XL.ORDER_NO = p_order_no
  order by order_no;
  
      
   if sor.print_type is null then
          v_retval := v_retval || '<tr>';
       elsif sor.print_type = 'grey/black/bold' then
           v_retval := v_retval || '<tr class = "gbb">';
       elsif sor.print_type = 'yellow/red/bold' then
           v_retval := v_retval || '<tr class = "yrb">';
       elsif sor.print_type = 'yellow/black/bold' then
           v_retval := v_retval || '<tr class = "ybb">';
        elsif sor.print_type = 'yellow/black/normal' then
           v_retval := v_retval || '<tr class = "ybn">';
       elsif sor.print_type = 'white/black/italic' then
           v_retval := v_retval || '<tr class = "wbi">';
       end if;
   v_retval := v_retval || '<td style="width:40px;">';
   
   v_retval := v_retval || sor.order_no;
   v_retval := v_retval || '</td>';
   v_retval := v_retval || '<td style="text-align:left; width:250px;">';
   v_retval := v_retval || lookup_super_type_name(sor.param_type_id);
   v_retval := v_retval || '</td>'; 
      for oszlop in oszlopok
      loop     
        -- vigyázz az utolsó paraméter OUT!!!!!!!!!   
        v_cell_value := LOOKUP_TR_XL_VALUE(p_treatm_id,p_lista_id,sor.param_type_id,oszlop.order_no,v_tr_xl_id,p_order_no);
        select count(1) into v_comment_no FROM cell_Comments WHERE row_id = v_tr_xl_id;
        v_retval := v_retval || '<td style="overflow:hidden; width:125px;">';
        if (oszlop.mutable != 0 OR sor.mutable !=0 ) AND p_editable IS null then
           v_retval := v_retval || '<input type="text" onchange="get_AJAX_SELECT_XML(this,'||v_tr_xl_id||')"  onkeydown="showKeyCode(event);"
                   size = "10" style = "text-align:right;"  class = "field" value="'||v_cell_value ||'">'; 
        else 
          v_retval := v_retval || v_cell_value;
        end if;
        v_retval := v_retval || '<a href="f?p='||v('APP_ID')||':1990:'||v('SESSION')||'::NO::P1990_row_ID:'||v_tr_xl_id||'">';
        IF v_comment_no = 0 then
           v_retval := v_retval || '<img src = "'||v('WORKSPACE_IMAGES')||'020h.png">';
        ELSE
           v_retval := v_retval || '<img src = "'||v('WORKSPACE_IMAGES')||'020.png">';
        END IF;
        v_retval := v_retval || '</a>';
        v_retval := v_retval || '</td>';
      end LOOP;
      v_retval := v_retval || '</tr>';
  RETURN v_retval;
end;

  PROCEDURE GET_DETAIL_ROWS_HTML(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_editable NUMBER DEFAULT NULL
  )
  AS
    
    cursor oszlopok is
    select *
    from dm_xl 
    where 
      DM_XL.LIST_TYPE_ID = p_lista_id and
      DM_XL.REL_TYPE_ID = 42
    order by order_no;

    cursor rs is
      select distinct order_no,PARAM_TYPE_ID 
      from  TR_XL 
      where LIST_TYPE_ID = p_lista_id
        and DATA_INCO_ID = p_treatm_id
      order by order_no;
   
    v_tr_xl_id number(12,0);
    v_cell_value varchar2(255);
    v_comment_no NUMBER(3);
    v_cell_sum NUMBER(15,2);

    v_ColTyps ColTyps;
    v_ColTyp_ev ColTyp;
    v_ColTyp_ho ColTyp;

    v_dm_xl_row DM_XL%ROWTYPE;
    v_dm_xl_rel_row_no NUMBER(3);
    v_dm_xl_col_id NUMBER(12,0);
    v_kell_calc NUMBER;
    v_dm_xl_rel1 NUMBER(12,0);
    v_dm_xl_rel2 NUMBER(12,0);

    v_cnt NUMBER := 0;

  BEGIN
    if p_lista_id in (100053,100132,100104,100122) then
--      htp.p(  '<tbody  class="scrollContent" style="vertical-align:top;">');
--      htp.p('***' ||p_lista_id || '***;***' || p_treatm_id|| '***' );
    FOR r in rs 
      loop
--            htp.p('loop');
            htp.p( '<TR><TD style="width:40px;">'|| to_char(r.order_no) ||'</TD>');
            --htp.p(  '<td style="text-align:left; width:160px;">&nbsp;</TD>');
            for oszlop in oszlopok
              loop
                --htp.p('DM_XL_ID2 = '||oszlop.dm_xl_id);
                select COUNT(1) INTO v_kell_calc 
                  FROM V_DM_XL_REL 
                  where DM_XL_ID2 = oszlop.dm_xl_id
                   AND REL_TYPE_ID = 46;
                if v_kell_calc > 0 then
--                   htp.p( 'v_kell_calc' );
                   v_cell_value := CALCULATE_COL_VALUE(p_treatm_id,oszlop.order_no,r.param_type_id,p_lista_id,r.order_no);
                   v_tr_xl_id := 0;
                else
                   -- az utolsó paraméter out !!
                   v_cell_value := GET_TR_XL_VALUE(p_treatm_id,p_lista_id,r.param_type_id,oszlop.param_type_id,r.order_no,v_tr_xl_id);
                end if;

                select count(1) into v_comment_no FROM cell_Comments WHERE row_id = v_tr_xl_id;
                htp.p(  '<td style="overflow:hidden; width:125px;" >' );
                if oszlop.mutable != 0 AND p_editable IS null then  
----                  if v_tr_xl_id = 0 then
----                    htp.p(  '<input type="text" onchange="insert_tr_xl(this,'||to_char(oszlop.dm_xl_id)||','||to_char(r.param_type_id)||','||to_char(p_treatm_id));
----                    htp.p(  ')"  onkeydown="showKeyCode(event);" size = "10" style = "text-align:right;"  class = "field" value="'); 
----                    htp.p( to_char(v_cell_value) ||'">');
----                  else
                    htp.p(  '<input type="text" onchange="set_tr_xl(this,'||to_char(v_tr_xl_id)||')"  onkeydown="showKeyCode(event);"
                   size = "9" style = "text-align:right;"  class = "field" value="'||to_char(v_cell_value) ||'">'); 
----                  end if;
                 
                else 
                   htp.p('<div id="cell_id_'|| trim(v_tr_xl_id) ||'" style="width=100px;">'|| to_char( v_cell_value ) || '</div>');
                end if;

/*
                htp.p(  '<a href="f?p='||v('APP_ID')||':1990:'||v('SESSION')||'::NO::P1990_ROW_ID:'||to_char(v_tr_xl_id)||'">');
                IF v_comment_no = 0 then
                   htp.p(  '<img src = "'||v('WORKSPACE_IMAGES')||'020h.png">');
                ELSE
                   htp.p(  '<img src = "'||v('WORKSPACE_IMAGES')||'020.png">');
                END IF;
                htp.p(  '</a>');
*/
                htp.p(  '</td>');
              end loop;
              htp.p( '</TR>'||CHR(10));
--              htp.p(  '</tbody>');
      end loop;
   if has_sum_column(p_lista_id)  = true then
       -- htp.p('*******'||p_lista_id||'*');
       -- htp.p('<tfoot class="scrollContent" style="vertical-align:top;">');
        htp.p('<tr style="font-weight: bold;">');
        htp.p('<TR id = "sum" ><TD style="width:40px;font-weight: bold;">&#x2211;</TD>');
        if p_lista_id in (100053,100132,100104,100122) then
          for oszlop in oszlopok
            loop
                   
                   htp.p(  '<td style="overflow:hidden; width:125px;font-weight: bold;">' );
    
                   if is_sum_column(oszlop.dm_xl_id,oszlop.param_type_id,p_treatm_id,p_lista_id) = true then             
                  --if oszlop.param_type_id in (101616,101640,101669,101623)then                 
                    htp.p(  '<div>' );
        SELECT SUM(NVL(TR_XL.PARAM_VALUE, 0))
          INTO v_cell_sum
          FROM TR_XL
          WHERE LIST_TYPE_ID = p_lista_id
            AND DATA_INCO_ID = p_treatm_id
            AND COLUMN_DATA_TYPE_ID = oszlop.param_type_id
            AND STATUS_ID != 919;
                      htp.p( to_char(v_cell_sum) );
                    htp.p(  '</div>' );
                  else
                    htp.p(  '&nbsp;');
                  end if;
                    htp.p(  '</td>');
            end loop;
  
         elsif p_lista_id = 100052 then
            for oszlop in oszlopok
            loop
                   htp.p(  '<td style="overflow:hidden; width:125px;font-weight: bold;">' );
                 
                   htp.p(  '&nbsp;');
                   htp.p(  '</td>');
            end loop;
         end if;
        htp.p( '</TR>'||CHR(10));
--        htp.p( '</tfoot>');
        end if;
    elsif p_lista_id = 100052 then
     for r in 1..12 loop        
        htp.p( '<TR><TD style="width:40px;">&nbsp;</TD>');
        for oszlop in oszlopok loop

          htp.p('<td style="overflow:hidden; width:125px;font-weight: bold;">');
            -- ha az oszlop benne van 
           select count(1) into v_dm_xl_rel_row_no from DM_XL_REL where DM_XL_ID1 = oszlop.dm_xl_id and REL_TYPE_ID = 95;
            if v_dm_xl_rel_row_no > 0 then
               null;
            else 
              select * into v_dm_xl_row from dm_xl
                  where DM_XL_ID =(select DM_XL_ID1 from DM_XL_REL 
                    where DM_XL_ID2 = (select DM_XL_ID from DM_XL  
                                       where LIST_TYPE_ID = 100052 
                                       AND REL_TYPE_ID = 49 /* Ez a DM_XL-ben a rel_type_id */
                                       AND ORDER_NO='1..x')
                    and DM_XL_REL.REL_TYPE_ID = 94 /* Ez a DM_XL_REL-ben a rel_type_id */
              );


              v_ColTyps := ColTyps();
              v_ColTyp_ev.column_value := 2014;
              v_ColTyp_ev.column_type_id := 101101;
              v_ColTyp_ho.column_value := r;
              v_ColTyp_ho.column_type_id := 101102;
              v_ColTyps.extend();
              v_ColTyps(1) := v_ColTyp_ev;
              v_ColTyps.extend();
              v_ColTyps(2) := v_ColTyp_ho;
              htp.p(get_tr_xl_cell_sum(oszlop.param_type_id,null,v_ColTyps,p_treatm_id, v_dm_xl_row.list_type_id));
              --htp.p(get_tr_xl_cell_sum(oszlop.param_type_id,null,v_ColTyps,p_treatm_id, 100053));
            end if;
          htp.p('</td>');
        end loop;
         htp.p('/<tr>');
     end loop;
    elsif p_lista_id = 100142 then
       select DM_XL_ID into v_dm_xl_col_id from dm_xl where DM_XL_ID in(
                             select DM_XL_ID1 from DM_XL_REL 
                             where  DM_XL_ID2 IN ( select DM_XL_ID FROM dm_xl where LIST_TYPE_ID = p_lista_id )
                             and    REL_TYPE_ID = 95);
       for row in ( select distinct PARAM_VALUE,list_type_id from TR_XL 
                           where    DATA_INCO_ID = p_treatm_id
                           AND      STATUS_ID != 919
                           and      col_dm_xl_id = v_dm_xl_col_id
                           order by PARAM_VALUE)
        loop
        v_cnt := v_cnt + 1;
        htp.p('<tr><TD style="width:40px;font-weight: bold;">'|| v_cnt ||'</TD>');

       for oszlop in oszlopok
          loop
                 htp.p(  '<td style="overflow:hidden; width:125px;font-weight: bold;">' );
                 select count(DM_XL_ID1) INTO v_dm_xl_rel1 FROM dm_xl_rel where DM_XL_ID2 = oszlop.dm_xl_id AND REL_TYPE_ID = 95;
                 if v_dm_xl_rel1 > 0 then
                   htp.p(  row.param_value ); 
                  else  
                   htp.p(get_tr_xl_cell_sum(oszlop.param_type_id, row.param_value, v_dm_xl_col_id, p_treatm_id, row.list_type_id));         
                -- htp.p( ' &nbsp;' );
                end if;
                 htp.p(  '</td>');
          end loop;
       htp.p('</tr>');
    end loop;

    if has_sum_column(p_lista_id)  = true then
        htp.p('<tr style="font-weight: bold;">');
        htp.p('<TR id = "sum" ><TD style="width:40px;font-weight: bold;">&#x2211;</TD>');
       
        for oszlop in oszlopok
         loop
           htp.p(  '<td style="overflow:hidden; width:125px;font-weight: bold;">' );
                 if is_sum_column(oszlop.dm_xl_id,oszlop.param_type_id,p_treatm_id,p_lista_id) = true then  
                    htp.p( 'true');
                  else
                    htp.p( '&nbsp;' );
                  end if ;  
           htp.p(  '</td>' );
         end loop;         
        htp.p('</tr>');
    end if;
    end if; 
  END; 

  FUNCTION GET_TR_XL_VALUE 
  (p_beerkezes_id NUMBER
  ,p_list_type_id NUMBER
  ,p_param_type_id NUMBER
  ,p_column_param_type_id NUMBER 
  ,p_order_no number
  ,p_tr_xl_id OUT NUMBER
  )
  RETURN VARCHAR2
AS
v_rec_no INTEGER;
v_tr_xl_row tr_xl%rowtype;
v_col_dm_xl_row dm_xl%rowtype;
BEGIN
--  htp.p('p_beerkezes_id'||p_beerkezes_id);
--  htp.p(':p_list_type_id'||p_list_type_id);
--  htp.p(':p_param_type_id'||p_param_type_id);
--  htp.p(':p_column_param_type_id'||p_column_param_type_id);
--  htp.p(':p_order_no'||p_order_no);

  if p_list_type_id = 100130 then --ha fej típusú a tábla
    return 'p_param_type_id:'||p_param_type_id||'<br> p_column_param_type_id:'||p_column_param_type_id||'<br> p_order_no:' || p_order_no;
  else
    SELECT COUNT(1)
      INTO v_rec_no
      FROM tr_xl
      WHERE data_inco_id = p_beerkezes_id
        AND list_type_id = p_list_type_id
        AND param_type_id = p_param_type_id
        AND COLUMN_DATA_TYPE_ID = p_column_param_type_id
        AND ORDER_NO = p_order_no
        AND status_id != 919;
--    htp.p(':v_rec_no'||v_rec_no||'<br>');

    IF v_rec_no = 0 THEN     
    p_tr_xl_id := 0;
    RETURN '';
  ELSIF v_rec_no = 1 THEN 
    SELECT * INTO v_tr_xl_row FROM tr_xl 
    WHERE data_inco_id = p_beerkezes_id
    AND list_type_id = p_list_type_id
    AND param_type_id = p_param_type_id
    AND COLUMN_DATA_TYPE_ID = p_column_param_type_id
    AND ORDER_NO = p_order_no
    AND status_id !=919;
    select * into v_col_dm_xl_row from dm_xl where DM_XL_ID = v_tr_xl_row.COL_DM_XL_ID;
    --if v_tr_xl_row.param_value is not null then
    if v_col_dm_xl_row.param_data_type = 'N' then
      p_tr_xl_id := v_tr_xl_row.tr_xl_id;
      begin      
         RETURN to_char(to_number(replace(v_tr_xl_row.param_value,',','.')),'999G999G990', 'nls_numeric_characters='', ''');
      EXCEPTION WHEN OTHERS THEN
       RETURN 'N/A';
      END;
    else
      p_tr_xl_id := v_tr_xl_row.tr_xl_id;
      RETURN v_tr_xl_row.param_value_chr;
    end if;
  ELSE
    RETURN  'HIBA';
 END IF;
  end if;
END;



FUNCTION GET_TR_XL_CELL_SUM(
      p_column_type_id NUMBER
     ,p_param_type_id  NUMBER
     ,p_col            NUMBER
     ,p_treatm_id      NUMBER
     ,p_lista_id       NUMBER
    )  RETURN NUMBER
AS 
    v_retval number := 0;
    v_sum number := 0;
    v_order_no number := 0;
    v_val number;
    v_must_add boolean;
    
    CURSOR tr_xl_rows is 
      select * from TR_XL 
      where DATA_INCO_ID = p_treatm_id
        and LIST_TYPE_ID = p_lista_id
        and COLUMN_DATA_TYPE_ID = p_column_type_id
        and STATUS_ID != 919;
      
    BEGIN
       FOR tr_xl_row in tr_xl_rows
        loop
          v_must_add := true;
          begin
           select TR_XL.PARAM_VALUE into v_val 
            FROM  TR_XL 
            where DATA_INCO_ID = p_treatm_id 
              and LIST_TYPE_ID = p_lista_id
              and ORDER_NO = tr_xl_row.ORDER_NO 
              and COLUMN_DATA_TYPE_ID = (select param_type_id FROM DM_XL WHERE DM_XL_ID =  p_col )
              and STATUS_ID != 919;    
            if v_val != p_param_type_id then
              v_must_add := false;
            end if;          
            if v_must_add  then 
              v_retval := v_retval + nvl(tr_xl_row.param_value,0);
           end if; 
            exception when others then
              null;
           end;      
        end loop;
      return v_retval; 
  end;



   FUNCTION get_tr_xl_cell_sum(
     p_column_type_id NUMBER
    ,p_param_type_id NUMBER
    ,p_cols          ColTyps
    ,p_treatm_id     NUMBER
    ,p_lista_id      NUMBER) 
    RETURN NUMBER
    AS
    v_retval number := 0;
    v_sum number := 0;
    v_order_no number := 0;
    v_val number;
    v_must_add boolean;
    
    CURSOR tr_xl_rows is 
      select * from TR_XL 
      where DATA_INCO_ID = p_treatm_id
        and LIST_TYPE_ID = p_lista_id
        and COLUMN_DATA_TYPE_ID = p_column_type_id
        and STATUS_ID != 919;
      
    BEGIN
       FOR tr_xl_row in tr_xl_rows
        loop
          v_must_add := true;
          FOR i IN 1 .. p_cols.COUNT
          LOOP
           select TR_XL.PARAM_VALUE into v_val 
            FROM TR_XL 
            where DATA_INCO_ID = p_treatm_id 
              and LIST_TYPE_ID = p_lista_id
              and ORDER_NO = tr_xl_row.ORDER_NO 
              and COLUMN_DATA_TYPE_ID = p_cols(i).column_type_id; 
            if v_val != p_cols(i).column_value then
              v_must_add := false;
            end if;
          END LOOP;           
            if v_must_add  then 
              v_retval := v_retval + nvl(tr_xl_row.param_value,0);
           end if;
        
        end loop;
      return v_retval;
  end;

   PROCEDURE INSERT_EMPTY_LINE(
    p_treatm_id NUMBER
  , p_lista_id NUMBER
  , p_doc_id NUMBER) 
  AS
    cursor oszlopok is
    select *
      from dm_xl 
      where 
          DM_XL.LIST_TYPE_ID = nvl(p_lista_id,GET_DOC_DEFAULT_LIST(p_doc_id)) and
          DM_XL.REL_TYPE_ID = 42
      order by order_no;

    v_sorok NUMBER;
    v_new_tr_xl_id NUMBER;
    v_sor_dm_xl_id NUMBER;
  BEGIN
--      htp.p('****'||p_lista_id||'****'||p_treatm_id);
   SELECT nvl( max( ORDER_NO ),0 ) + 1 INTO v_sorok from tr_xl where LIST_TYPE_ID = GET_DOC_DEFAULT_LIST(p_doc_id) and DATA_INCO_ID = p_treatm_id;
      
   BEGIN
      SELECT dm_xl_id into v_sor_dm_xl_id 
        from dm_xl 
        where LIST_TYPE_ID = nvl(p_lista_id,GET_DOC_DEFAULT_LIST(p_doc_id))
         AND REL_TYPE_ID = 49
         AND ORDER_NO = '1..x';
    EXCEPTION 
      WHEN TOO_MANY_ROWS THEN
       RAISE_APPLICATION_ERROR (-20001,'A DM_XL-ben túl sok tételsor van megadva');
      WHEN NO_DATA_FOUND THEN
       RAISE_APPLICATION_ERROR (-20001,'A DM_XL-ben nincs tételsor megadva');
    END;
    htp.p('<tr>'); 
    htp.p('<td style="width:40px;">'|| v_sorok || '</td>');
    for oszlop in oszlopok
    loop     
       if oszlop.order_reg is null then
          insert into TR_XL (COLUMN_DATA_TYPE_ID,data_inco_id,order_no,param_type_id,LIST_TYPE_ID,COLUMN_NO,COL_DM_XL_ID,ROW_DM_XL_ID) 
            VALUES (oszlop.param_type_id,p_treatm_id,v_sorok,60505,nvl(p_lista_id,GET_DOC_DEFAULT_LIST(p_doc_id))
            ,oszlop.order_no,oszlop.DM_XL_ID,v_sor_dm_xl_id) 
            RETURNING tr_xl_id INTO v_new_tr_xl_id;
          htp.p(  '<td><input type="text" onchange="set_tr_xl(this,'||to_char(v_new_tr_xl_id)||')"  onkeydown="showKeyCode(event);"
                   size = "9" style = "text-align:right;"  class = "field" value=""></td>'); 
      else
         htp.p('<td>brutty</td>');
      end if; 
    end loop;
    htp.p('</tr>');
  END;
    

    FUNCTION is_sum_column(
     p_column_dm_xl_id NUMBER
    ,p_param_type_id  NUMBER
    ,p_treatm_id      NUMBER
    ,p_lista_id       NUMBER
    ) return BOOLEAN
    as
    v_retval boolean := false;
    v_cnt number;
    begin
     
       select count(1) into v_cnt from v_dm_xl_rel 
        --where  dm_xl_id2 = 60505
        where  dm_xl_id1 = p_column_dm_xl_id
        and    list_type_id1 = p_lista_id
        and    rel_type_id = 96;
      
      if v_cnt > 0 then
        return true;
      else
        return false;
      end if;
   end;

FUNCTION has_sum_column(
     p_lista_id      NUMBER
    ) return BOOLEAN
      as
v_retval boolean := false;
    v_cnt number;
    begin   
       select count(1) into v_cnt 
       from v_dm_xl_rel 
        where  list_type_id1 = p_lista_id
        and    rel_type_id = 96
        and    ORDER_NO2 = '1..x';
      if v_cnt > 0 then
        return true;
      else
        return false;
      end if;
   end;
END GENERATE_HTML;

/