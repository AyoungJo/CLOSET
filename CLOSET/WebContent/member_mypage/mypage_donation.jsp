<%@page import="java.io.IOException"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 
FileInputStream fis = null;
BufferedOutputStream bos = null;
 
try{
    String fileName = "D:/donation.pdf";
    File file = new File(fileName);
    
    // 보여주기
    response.setContentType("application/pdf");
    response.setHeader("Content-Description", "JSP Generated Data");
    // 다운로드
    //response.addHeader("Content-Disposition", "attachment; filename = " + file.getName() + ".pdf");
 
    fis = new FileInputStream(file);
    int size = fis.available();
    
    byte[] buf = new byte[size];
    int readCount = fis.read(buf);
 
    response.flushBuffer();
 
    bos = new BufferedOutputStream(response.getOutputStream());
    bos.write(buf, 0, readCount);
    bos.flush();
} catch(Exception e) {
    response.setContentType("text/html;charset=euc-kr");
    out.println("<script language='javascript'>");
    out.println("alert('파일 오픈 중 오류가 발생하였습니다.');");
    out.println("</script>");
    e.printStackTrace();
} finally{
    try{
        if(fis != null) fis.close();
        if(bos != null) bos.close();
    } catch(IOException e){
        e.printStackTrace();
    }    
}
%>
</body>
</html>