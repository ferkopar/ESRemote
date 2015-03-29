declare 
   l_lista_id varchar(255);
BEGIN
   l_lista_id := wwv_flow.g_x01; 
   generate_html.INSERT_EMPTY_LINE(:P6000_DATA_INCO_ID, :P6000_LISTA_ID, :P6000_DOC_ID);
END;