<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename1 = request.getParameter("filename1");
	String origfilename1 = request.getParameter("origfilename1");

%>
<html>
<head>
<title>파일 업로드 확인 및 다운로드</title>
</head>
<body>
올린 사람 : <%= name%><br>
제목 : <%= subject%><br>
파일명1 : <a href="file_down.jsp?file_name=<%=filename1 %>"><%=origfilename1 %></a><br>
</body>
</html>
