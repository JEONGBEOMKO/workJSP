<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<!-- 여기에서 bbsList.jsp 보면서 수정 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>ccsList.jsp</title>
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
		color:dodgerblue;
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
		border: 1px solid gray;
		border-collapse: collapse;  /* 테두리 사이 간격 없애고 싶을 때 사용 */
	}
	td{
		border: 1px solid gray;
		padding-left: 15px;
		padding-top: 10px;
		padding-bottom: 10px;
	}
	.title{
		font-weight: bold;
	}
	.count_title{
		display: inline-block;
		width: 205px;
		text-align: right;
		font-weight: bold;
	}
	.count{
		width: 50px; 
		display: inline-block;
		text-align: right;
	}
 </style>
</head>

<body>
<%!
	int pageCount, pageNUM, startRow, endRow, startpage, endpage, tmp;
	String pnum;
	String sqry="", skey="", sval="", returnpage="";
%>

<%	
	//총레코드개수
	msg = "select count(*) as cnt from bbs";
	RS = ST.executeQuery(msg);
	if(RS.next()){GGtotal = RS.getInt("cnt");}
	//검색
	skey=request.getParameter("keyfield");
	sval=request.getParameter("keyword");
	if(skey==null || sval==null || skey=="" || sval==""){
		skey="title";
		sval="";
	}
	sqry = "where " + skey + " like '%" + sval + "%'";
	//검색레코드개수
	String search = "select count(*) as cnt from bbs "+ sqry;
	RS = ST.executeQuery(search);
	if(RS.next()==true){Gtotal = RS.getInt("cnt");}
	//페이징될 행번호
	pnum = request.getParameter("pageNum");
	if(pnum==null || pnum==""){pnum ="1";}
	pageNUM = Integer.parseInt(pnum);
	
	startRow = (pageNUM - 1) * 10 + 1;
	endRow = pageNUM * 10;
%>
	<h2>자유게시판</h2>
	<table>
		<tr class="title">
			<td colspan="5">
				<a href="#">메인</a>&emsp;
				<a href="ccsList.jsp">자유게시판</a>
			</td>
		</tr>
		<tr class="search">
			<td colspan="5">
			<form name="myform" action="ccsList.jsp" style="display: inline;">
				<span class="title">검색</span>:
				<select name="keyfield" style="text-align: center;">
					<option value="">--검색기준--</option>				
					<option value="title">--제&ensp;목--</option>				
					<option value="name">--글쓴이--</option>				
				</select>			
				<input type="text" name="keyword">
				<input type="button" value="검 색">
			</form>
			<span class="count_title">레코드개수</span>:
			<span class="count"><%=Gtotal %></span> 
			   /<%=GGtotal %>
			</td>
		</tr>

		<tr class="title" bgcolor="aliceblue">
			<td>행번호</td> <td>제 목</td> <td>글쓴이</td> <td>조회수</td> <td>날 짜</td>     
		</tr>
<%
	try{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd EEE요일 aaa");
		java.util.Date dt = new java.util.Date();
		String display = sdf.format(dt);
		System.out.println(display);
		
		msg = "select * from (select rownum as rn, b.* from bbs b " + sqry + ") " + 
				"where rn between " + startRow + " and " + endRow;
		System.out.println(msg);
		RS = ST.executeQuery(msg);
		while(RS.next()){
			Grn = RS.getInt("rn");
			Gname = RS.getString("name");
			Gtitle = RS.getString("title");
			Ghit = RS.getInt("hit");
			Gwdate = RS.getDate("wdate");
			display = sdf.format(Gwdate);
%>		
		<tr>
		<td><%= Grn %></td>
		<td><%= Gtitle %></td>
		<td><%=Gname %></td>
		<td><%= Ghit %></td>
		<td><%= display %></td>
		</tr>
		
<%
		}//while
	} catch(Exception e){System.out.println("데이터 전체출력 에러: " + e);}
%>		
		<tr>
			<td colspan="5" align="center">
<%

	//페이지 번호
	if(Gtotal % 10 ==0) {pageCount = Gtotal / 10;}
	else{pageCount = Gtotal / 10 + 1;}
	
	tmp = (pageNUM - 1) % 10;
	startpage = pageNUM - tmp;
	endpage = startpage + 9;
	if(endpage > pageCount){endpage = pageCount;}
	//검색시 페이지
	returnpage = "&keyfield=" + skey + "&keyword=" + sval;
	
	//페이징
	if(startpage > 1){
		out.println("<a href=ccsList.jsp?pageNum=" + (startpage - 10) + ">[이전]</a>&nbsp;");
	}
	for(int i = startpage; i <= endpage; i++){
		out.println("<a href=ccsList.jsp?pageNum=" + (i + returnpage) + ">[" + i + "]</a>&nbsp;");
	}
	if(endpage < pageCount){
		out.println("<a href=ccsList.jsp?pageNum=" + (startpage + 10) + ">[다음]</a>");
	}

%>			
			</td>		
		</tr>
	</table>
</body>
</html>