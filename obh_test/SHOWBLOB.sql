--------------------------------------------------------
--  DDL for Procedure SHOWBLOB
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "SHOWBLOB" (p_mm_id IN INTEGER)
as
    page_b_contents blob;
    INTIMGSIZE integer;
    content_type mm_files.main_type%TYPE;
begin
    select main_type, mm_blob
    into CONTENT_TYPE, PAGE_B_CONTENTS
    from MM_FILES
    where mm_id = p_mm_id;
    -- get image size
    intImgSize := dbms_lob.getlength(page_b_contents);
    -- print the header    
    owa_util.mime_header(content_type, FALSE, NULL);
        htp.p('Content-length: '|| intImgSize);
        -- htp.p('Pragma: no-cache');
        -- htp.p('Cache-Control: no-cache');
        -- htp.p('Expires: Thu, 01 Jan 1970 12:00:00 GMT');
        owa_util.http_header_close;
    -- download BLOB
    wpg_docload.download_file(page_b_contents);
end;

/
