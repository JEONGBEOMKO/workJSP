<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%-- <%@ include file="ssi.jsp" %> --%>

<%@ page import="net.bitcamp.guest.GuestDAO" %>
<%@ page import="net.bitcamp.guest.GuestDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>guestDeleteSave.jsp</title>
 <style type="text/css">
   *{font-size:16pt;}
   a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
   a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
 </style>
</head>
<body>

<!-- guestDeleteSave.jsp단독실행하면 에러발생 -->
<div align="center">
	<h2>guestDeleteSave.jsp</h2>
	<img src="images/tulips.png" width=500 height=300>
	<p>
	<a href="guestWrite.jsp">[방명록등록]</a>
	<a href="guestList.jsp">[전체출력]</a>
</div>

<%
	String ob = (String)session.getAttribute("naver");  //원래 object형인데 그건 우리가 보기 어려우니까 그냥 String으로 일단 데이터 타입 변경시킴
	System.out.println("11-08-monday 세션값 확인 = " + ob);
	if( ob == null || ob.equals("") || ob == ""){
%>
	<script>
		alert("인증된 유저가 아닙니다\n삭제권한이 없습니다. 다시 로그인하세요");
		location.href="login.jsp";
	</script>

<%
		
	} else{
		//삭제할때는 바로 넘어가는게 사용자 입장에서 안 답답해서 좋음
		GuestDAO mydao = new GuestDAO();
		int data = Integer.parseInt(request.getParameter("idx"));
		mydao.dbDelete(data);
		response.sendRedirect("guestList.jsp");  //하단 자바스크립트 필요없음	
	}
	
%>

<!-- <script type="text/javascript">
   setTimeout("location.href='guestList.jsp'" , 1000); //3000=3초
</script> -->
</body>
</html>















