<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>testList_U.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> testList.jsp </h2>
<%!
   //전역변수 선언
   String Ggender, Gimage;
%>
<%
 msg="select count(*) as cnt from test"; 
 RS=ST.executeQuery(msg); 
 if(RS.next()==true){Gtotal = RS.getInt("cnt");}
%>

 <table border="1" width="900"  cellspacing="0">
  	<tr align="center">
  		<td colspan="5"> <img src="images/bar.gif">  </td> 
  	</tr>
  	<tr align="right">
  		<td colspan="5"> 레코드갯수: <%= Gtotal %> &nbsp;  </td> 
  	</tr>
  	
  	<tr bgcolor="mistyrose">
  		<td>제  목</td>  <td>급  여</td>   <td>성  별</td>  <td>날  짜</td>  <td>이미지</td> 
  	</tr>
	  	 	
<%
 try{
	String path = application.getRealPath("storage");
	
	msg = "select * from test order by title asc";
	ST = CN.createStatement();
 	RS = ST.executeQuery(msg);
 	while(RS.next()==true){
 		Gcode = RS.getInt("code");
		Gtitle = RS.getString("title");
		Gpay = RS.getInt("pay");
		Gwdate = RS.getDate("wdate");
		Ggender = RS.getString("gender");
		Gimage = RS.getString("img_file_name");
%>	
  	<tr>
	 	<td> <a href="testDetail.jsp?idx=<%= Gcode %>"> <%= Gtitle %> </a></td>
	 	<td> <%= Gpay %> </td>
	 	<td> <%= Ggender %> </td>
	 	<td> <%= Gwdate %> </td>
	 	<td align="center"> 
	 	<img src="<%=request.getContextPath()%>/storage/<%= Gimage %>"
	 	      style= "width: 70px; height: 50px;"></td>
 	</tr>
<%  	 
 	}//while
 		System.out.println("test 테이블 조회 성공!");
 }catch(Exception ex){ System.out.println("이미지게시판조회에러 " + ex.toString());}
 %> 	
 </table>
  <p>
 <a href="testWrite.jsp">[testWrite]</a>
 <a href="testList.jsp">[testList]</a>
 <a href="testListImage.jsp">[이미지게시판]</a>
 <a href="index.jsp">[index]</a>
 <a href="login.jsp">[login]</a>
</body>
</html>
