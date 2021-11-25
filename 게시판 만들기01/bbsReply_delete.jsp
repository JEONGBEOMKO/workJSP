<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>bbsReply_delete.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> bbsReply_delete.jsp=bbsReply_deleteSave문서와같은역할 </h2>
<%

 try{
	 int rsabun = Integer.parseInt(request.getParameter("idx"));
	 int rrn = Integer.parseInt(request.getParameter("dnum"));
	 
	 msg = "delete from bbsreply where num = " + rrn;
   	 ST.executeUpdate(msg);
     response.sendRedirect("bbsDetail.jsp?idx=" + rsabun);
 }catch(Exception ex){System.out.println("bbsreply_delete.jsp 댓글삭제에러:" + ex.toString());}
%>	

</body>
</html>





