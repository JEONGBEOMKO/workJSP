<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>bbsList.jsp</title>
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
   		border-collapse: collapse;  /* 테두리 사이 간격 없애고 싶을 때 사용 */
	}
	td{
		padding-left: 15px;
		padding-top: 7px;
		padding-bottom: 7px;
	}
	.count_title{
		display: inline-block;
		width: 260px;
		text-align: right;
		font-weight: bold;
	}
	.count{
		width: 30px; 
		display: inline-block;
		text-align: right;
	}
	.btn{
		font-size: 16pt;
		border: 1px solid maroon;
		border-radius: 5px;
		padding: 5px 8px;
		background-color: lavenderblush;
		color: firebrick;
		box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
	}
	.btn:hover{
		background-color: mistyrose;
		border: 1px solid salmon;
		color: firebrick;
	}
	.btn:active { 
		box-shadow: 1px 1px 0 rgb(0,0,0,0); 
		position: relative; 
		top:1px; 
	}
 </style>
</head>

<body>
<!-- <h2>bbsList.jsp문서 페이지&검색</h2> -->
<%
	msg = "select count(*) as cnt from bbs ";
	ST = CN.createStatement();
	RS = ST.executeQuery(msg);
	if(RS.next()==true){GGtotal=RS.getInt("cnt");}
%>

<%
	int startRow, endRow;  //페이지 번호 시작행번호, 페이지 번호의 끝행번호 where rn between start변수 and end 변수
	String pnum;
	int pageNUM;  //pageNum 문자열을 숫자로 변환
	int pageCount, startpage, endpage;  //pageCount=32페이지 startpage=1, endpage=10
	int tmp;
 	int Gcnt;
	//검색관련 4개 변수
	String sqry="";
	String skey="", sval="";
	String returnpage="";
	
	skey = request.getParameter("keyfield");  //검색키=필드
	sval = request.getParameter("keyword");  //검색어키워드
	if(skey=="" || sval=="" || skey==null || sval==null){
		skey="title";
		sval="";
	} // 검색 제대로 선택 안 했을 때 기본 설정 값
	
	//returnpage변수 사용안함
	returnpage = "&keyfield=" + skey + "&keyword=" + sval;
	
	//검색레코드개수
	sqry = " where " + skey + " like '%" + sval + "%' ";
	String find = "select count(*) as cnt from bbs" + sqry;
	//System.out.println(find);
	ST = CN.createStatement();
	RS = ST.executeQuery(find);
	if(RS.next()==true){Gtotal = RS.getInt("cnt");}
	
	
	pnum = request.getParameter("pageNum");  //<a href=bbsList.jsp?pageNum=i  7페이지를 누른다면 [7]을 문자화해서 저장함
	if(pnum == null || pnum == ""){pnum="1";}   //저장 및 삭제했을 때 이렇게 나올 수 있도록
	//System.out.println("넘어온 문자페이지 번호 = " + pnum);
	pageNUM = Integer.parseInt(pnum);  //아까 문자화 시킨걸 숫자화
	
	startRow = (pageNUM - 1) * 10 + 1;  //시작행번호
	endRow = pageNUM * 10;  //끝행번호  msg = "select ~~  rn between start and end";
	
	//System.out.println("몫계산 6/10=" + (6/10));
	//System.out.println("나머지 6%10=" + (6%10));
	//전체레코드개수 319개/10 + 1 = 32  . 만약에 310/10은 31개
			
/* 	if(GGtotal%10==0){pageCount = GGtotal / 10;} 원래했던 총페이지 수
	else{pageCount = GGtotal / 10 + 1;}  //우리는 총 32페이지 */
	
	if(Gtotal%10==0){pageCount = Gtotal / 10;} 
	else{pageCount = Gtotal / 10 + 1;}  //우리는 총 32페이지
	
	tmp = (pageNUM-1)%10;  //if pageNUM이 28이면 tmp는 7임
	startpage = pageNUM-tmp;  //21
	endpage = startpage + 9;
	if(endpage>pageCount){endpage=pageCount;}
	
	//System.out.println("pageNUM=" + pageNUM + " pageCount=" + pageCount + " startpage=" + startpage + " endpage=" + endpage);
%>

<jsp:include page="bbsHeader.jsp" />

<table border="1">
		<tr class="title">
			<td colspan="7">
				<a href="#">메인</a>&emsp;
				<a href="ccsList.jsp">자유게시판</a>
			</td>
		</tr>
		<tr class="search">
			<td colspan="7">
			<form name="myform" action="bbsList.jsp" style="display: inline;">
				<span class="title">검색</span>:
				<select name="keyfield" style="text-align: center;">
					<option value="">--검색기준--</option>				
					<option value="title">--제&ensp;목--</option>				
					<option value="name">--글쓴이--</option>				
				</select>			
				<input type="text" name="keyword">
				<input type="button" value="검 색" class="btn">
			</form>
			<span class="count_title">레코드개수</span>:
			<span class="count"><%=Gtotal %></span> 
			   /<%=GGtotal %>
			</td>
		</tr>

<tr bgcolor="mistyrose">
	<td>행번호</td> <td>사 번</td> <td>이 름</td> <td>제 목</td>  <td>날 짜</td> <td>조회수</td> <td>메 일</td>  
</tr>	
<%
	try{
		//msg = "select rownum, b. * from bbs b";
		//msg = "select rownum, b. * from bbs b where rownum between 1 and 10";
		//msg = "select * from (select rownum as rn, b. * from bbs b) where rn between " + startRow + " and " + endRow;
		String a = "select * from (";
		String b = "select rownum rn, b.*, (select count(*) from bbsreply r where b.sabun=r.sabun) as rcnt from ";
		String c = "(select * from bbs where " + skey + " like '%" + sval + "%') b";
		String d = " ) where rn between " + startRow + " and " + endRow;
		msg = a+b+c+d;
		//System.out.println(msg);
		ST = CN.createStatement();
		RS = ST.executeQuery(msg);
		while(RS.next()==true){
			Grn = RS.getInt("rn");   //가짜 행번호 rn으로 기술
			Gsabun = RS.getInt("sabun");
			Gname = RS.getString("name");
			Gtitle = RS.getString("title");
			Gwdate = RS.getDate("wdate");
			Ghit = RS.getInt("hit");
			Gemail = RS.getString("email");
			Gcnt = RS.getInt("rcnt");
%>    	
  <tr>
    <td> <%= Grn %> </td>
    <td> <%= Gsabun %> </td>
    <td> <%= Gname %> </td>
    <td> <a href="bbsDetail.jsp?idx=<%=Gsabun%>"><%= Gtitle %></a> <% if(Gcnt > 0) { out.println("[" + Gcnt + "]"); }%> </td>
    <td> <%= Gwdate %> </td>
    <td> <%= Ghit %> </td>
    <td> <%= Gemail %> </td>
  </tr>  
<%   
		}  //while
	} catch(Exception ex){System.out.println("bbs데이터전체출력 에러" + ex);}
%>	

<tr>
	<td colspan="7" align="center">
		<%
			//이전표시 startpage > 10
			if(startpage > 10){
				out.println("<a href=bbsList.jsp?pageNum=" + (startpage - 10) + ">[이전]</a>");
			}
			// [1] ~ [10]
			for(int i = startpage; i <= endpage; i++){
				if(i==pageNUM){
					out.println("<font style= 'font-size: 16pt; color: salmon; font-family: Cafe24SsurroundAir'>[" + i + "]</font>");
				}else{
				//out.println("[" + i + "]");
				out.println("<a href=bbsList.jsp?pageNum=" + (i+returnpage) + ">[" + i + "]</a>");
				}
			}//for
			//out.println("[다음]");
			
			//다음표시
			//다음 endpage< pageCount 이면 다음으로 이동
			if(endpage < pageCount){
				out.println("<a href=bbsList.jsp?pageNum=" + (startpage + 10) + ">[다음]</a>");
			}
		%>
	</td>
</tr>
<!-- 
<tr>
	<td colspan="7" align="center">
	<a href="bbsWrite.jsp">[bbs등록]</a>
	<a href="bbsList.jsp">[bbs전체출력]</a>
	<a href="testList.jsp">[testList]</a>
	</td>
</tr> -->

</table>

<jsp:include page="bbsFooter.jsp"></jsp:include>		

</body>
</html>








