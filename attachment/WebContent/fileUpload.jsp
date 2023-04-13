<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.lang.Object" %>
<%
	String uploadPath=request.getRealPath("/upload");	// 저장되는 폴더 위치, multipart보다 위에 있어야함.
	
	int size = 10*1024*1024;	// 10MB, 1024*1024크기란 것임.
	String name="";
	String subject="";
	String filename1="";
	String filename2="";
	String origfilename1="";
	String origfilename2="";
	
	try{
		MultipartRequest multi = new MultipartRequest(request,
							uploadPath,
							size, 
							"UTF-8",
				new DefaultFileRenamePolicy());

		name=multi.getParameter("name");
		subject=multi.getParameter("subject");
		
		Enumeration files=multi.getFileNames();
		
		String file1 =(String)files.nextElement();
		filename1=multi.getFilesystemName(file1);
		origfilename1= multi.getOriginalFileName(file1);
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<html>
<body>
<form name="filecheck" action="fileCheck.jsp" method="post">
	<input type="hidden" name="name" value="<%=name%>">
	<input type="hidden" name="subject" value="<%=subject%>">
	<input type="hidden" name="filename1" value="<%=filename1%>">
	<input type="hidden" name="origfilename1" value="<%=origfilename1%>">
</form>
<a href="#" onclick="javascript:filecheck.submit()"> 다운로드 페이지 이동</a>
</body>
</html>