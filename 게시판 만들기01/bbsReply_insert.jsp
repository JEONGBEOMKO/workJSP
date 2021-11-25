<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>bbsReply_insert.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> bbsReply_insert.jsp </h2>
<%
	 //bbsReply_insert.jsp=bbsReply_insertSave.jsp같은역할
	 String iwriter = request.getParameter("writer");
	 String icontent = request.getParameter("content");
	 String isabun = request.getParameter("sabun");
	 System.out.println("댓글저장 처리문서 bbsReply_inser;jsp");
	 System.out.println("댓글저자 = " + iwriter);
	 System.out.println("댓글내용 = " + icontent);
	 System.out.println("댓글사번 = " + isabun);
	 try{
	   msg ="insert into bbsreply values(bbsreply_seq.nextval, ?, ?, ?)";
	   PST = CN.prepareStatement(msg);
	   		PST.setString(1, iwriter);
	   		PST.setString(2, icontent);
	   		PST.setString(3, isabun);
	   PST.executeUpdate(); //괄호안의 매개인자 없어요
	   response.sendRedirect("bbsDetail.jsp?idx=" + isabun);
	 }catch(Exception ex){System.out.println("bbsreply_insert.jsp 댓글등록에러:" + ex.toString());}
%>	

</body>
</html>