<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="net.bitcamp.guest.GuestDAO" %>
<%@ page import="net.bitcamp.guest.GuestDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>bbsDetail.jsp</title>
 <style type="text/css">
	@font-face {
	    font-family: 'Cafe24SsurroundAir';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
	*{
	   	font-size:16pt;
	   	font-family: "Cafe24SsurroundAir";
	}
	a{
		font-size:16pt; 
		text-decoration:none; 
		color:blueviolet;
		font-family: "Cafe24SsurroundAir";
	}
	a:hover{
		font-size:16pt; 
		text-decoration:underline; 
		color:goldenrod;
		font-family: "Cafe24SsurroundAir";
	}
	table{
   		width: 900px;
   		margin-right: auto;
   		margin-left: auto;
   		cellpadding: 4px;
	}
 </style>
</head>
<body>
<p></p>
<%
	int data = Integer.parseInt(request.getParameter("idx"));
	msg = "update bbs set hit = hit + 1 where sabun = "+ data;
	ST.executeUpdate(msg);
	//System.out.println("bbs테이블 조회수 1 증가 성공");
	
	//guestDetai.jsp단독실행금지 
	msg = "select * from bbs where sabun = " + data;
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);
	if(RS.next()==true){
		Gsabun = RS.getInt("sabun");
		Gname = RS.getString("name");
		Gtitle = RS.getString("title");
		Gwdate = RS.getDate("wdate");
		Ghit = RS.getInt("hit");
		Gemail = RS.getString("email");
	}
	
%>	

<jsp:include page="bbsHeader.jsp" />    
	
<table border="1" width="900"  cellspacing="0" cellpadding="10px">
   <tr align="center">
   	 <td colspan="4" bgcolor="mistyrose">
   	 	<font style="font-size:26pt;color:firebrick; font-weight:bold;"> 제목 <%= Gtitle %> 상세페이지 </font> 
   	  </td>
   </tr>
   <tr align="right">
   <td colspan="4"> 조회수: <%= Ghit %>&emsp; </td>
   </tr>
  	<tr>
<!--   		<td width="250"  rowspan="4" align="center" >
  		  <img src="images/bbb.gif" width="350" height="200"> 
  		</td>  -->
  		<td> 사번:  <%= Gsabun %>  </td>

  	   <td> 이름: <%= Gname %>  </td>

  	   <td> 날짜: <%= Gwdate %>  </td>

  	   <td> 메일: <%= Gemail %>  </td>
  	</tr>
  	<tr>
	  	<td colspan="4">
	  	El Tribunal Arbitral del Deporte (TAS) ha sentenciado que no habrá atletas rusos en los Juegos de Río 
	  	y al hacerlo otorga cobertura legal a una exclusión total del deporte ruso en la cita olímpica, 
	  	una de las posibilidades que estudia el Comité Olímpico Internacional (COI) para castigar el dopaje de Estado en Rusia.<br>
	  	</td>
  	</tr>
  	<tr align="center">
  	   <td colspan="4">
  	   		<a href="login.jsp">[login]</a>
			<a href="bbsWrite.jsp">[bbs등록]</a>
			<a href="bbsList.jsp">[bbs출력]</a>
			<a href="index.jsp">[index]</a>
			<!-- <a href="testList.jsp">[testList]</a> -->
  	   </td>
  	</tr>
 </table>
 <p><hr color="lightsalmon" size=3 style="width: 900px; align: center;">
 <jsp:include page="bbsReply.jsp">
 	<jsp:param value="<%=Gsabun %>" name="Ridx"/>
 </jsp:include>
 <jsp:include page="bbsFooter.jsp"></jsp:include>	

</body>
</html>







