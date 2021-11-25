<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [bbsReply.jsp] </title>
<style type="text/css">
   	@font-face {
	    font-family: 'Cafe24SsurroundAir';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/Cafe24SsurroundAir.woff') format('woff');
	    font-weight: normal;
	    font-style: normal;
	}
    *{
    	font-size:16pt; 
    	font-family: 
    	'Cafe24SsurroundAir';
    }
    a{
    	font-size:16pt; 
    	text-decoration:none; 
    	font-weight:bold; 
    	color:dodgerblue;
    	font-family: 'Cafe24SsurroundAir';
    }
    a:hover{
    	font-size:16pt; 
    	text-decoration:underline; 
    	color:goldenrod;
    	font-family: 'Cafe24SsurroundAir';
    }
   	table{
   		width: 900px;
   		margin-right: auto;
   		margin-left: auto;
   		border-collapse: collapse;  /* 테두리 사이 간격 없애고 싶을 때 사용 */
	}
	td{
		padding-left: 15px;
		padding-top: 10px;
		padding-bottom: 10px;
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

<script type="text/javascript">
  var gr_num; //전역변수
  
  function re_edit(num, writer, content){
	  gr_num=num;
	  reply_form.bt_save.value = "댓글수정";
	  reply_form.writer.value=writer;
	  reply_form.content.value=content;
  }//end
  
  function re_save(sabun){
	 var bt = reply_form.bt_save.value;
	 var writer = reply_form.writer.value;
	 var content = reply_form.content.value;
	 //alert(bt+' '+writer+' '+content);
	 if(bt=="댓글저장"){
		  document.reply_form.action="bbsReply_insert.jsp?writer="+writer+"&content="+content+"&sabun="+sabun;
		  document.reply_form.method="post"; //생략가능   -------> post로 바꾸기
		  document.reply_form.submit();
	 }else if(bt=="댓글수정"){
		  reply_form.bt_save.value = "댓글저장";
		  document.reply_form.action="bbsReply_edit.jsp?writer="+writer+"&content="+content+"&sabun="+sabun+"&num="+gr_num;         
		  document.reply_form.method="post";
		  document.reply_form.submit();
	 } 
  }//end
</script>
</head>
<body>
   
 <%

   //bbsDetail.jsp문서 단독실행금지  더불어 include대상문서
   //String Rdata = request.getParameter("Ridx") ;
   String Rdata = request.getParameter("Ridx") ;
   System.out.println("bbsReply.jsp댓글문서 넘어온  Ridx="+ Rdata);
 %>
 	
 <form name="reply_form">
 	 <table border="1">
 	 <tr>
 	  	<td> <img src="images/z1.gif"> Gidx: <img src="images/z1.gif">  </td>
 	  	<td> <input type="text" name="sabun" value="<%= Rdata %>" size=30 readonly> </td>
 	  	<td rowspan="3"  align="center">
 	  		<input type="button" id="rsave" name="bt_save" onClick="re_save(<%= Rdata %>);" value="댓글저장" class="btn">
 	  	</td>
 	  </tr>
 	  
 	  <tr>
 	  	<td> <img src="images/z1.gif"> 저자: <img src="images/z1.gif">  </td>
 	  	<td> <input type="text" name="writer" size=30> </td>
 	  </tr>
 	  
 	  <tr>
 	  	<td> <img src="images/z1.gif"> 내용: <img src="images/z1.gif">  </td>
 	  	<td> <textarea rows="3" cols="27" name="content"></textarea> </td>
 	  </tr>
 	 </table>
 </form>
 	
 <p>
 <table width=900 border=0 cellspacing=0>
 <caption> <<<< 댓글내용출력  >>>> </caption>
  <tr bgcolor="pink">
  	<td>번호</td>
  	<td>저자</td>
  	<td>댓글내용</td>
  	<td>참조사번</td>
  	<td>수정/삭제</td>
  </tr>
<%
  //StringBuffer sb = new StringBuffer( );//미사용 , StringBuilder
  //sb.append("select rownum rrn, b.sabun, r.num, r.writer, r.content from bbs b ");
  //sb.append(" inner join bbsreply r ");
  //sb.append(" on b.sabun = r.sabun  ");
  //sb.append(" and r.sabun = " + Rdata) ; 
 
 String a = "select rownum rrn, b.sabun, r.num, r.writer, r.content  from  bbs b ";
 String b = " inner join bbsreply r ";
 String y = " on b.sabun = r.sabun ";
 String c = " and r.sabun = " + Rdata ;
 msg = a+b+y+c;
 ST=CN.createStatement();
 RS = ST.executeQuery(msg);
 while(RS.next()){
 	Rrn = RS.getInt("rrn");
 	Rnum = RS.getInt("num");
 	Rwriter = RS.getString("writer");
 	Rcontent = RS.getString("content");
 	Rsabun = RS.getInt("sabun");
%>
  <tr onmouseover="style.backgroundColor='#EEEEEE'" onmouseout="style.backgroundColor='' ">
  	<td width=70>  <%=Rrn%> </td> 
  	<td width=150> <%=Rwriter%> </td>
  	<td width=200> <%=Rcontent%> </td>
  	<td width=200> <%=Rsabun%> </td>
  	<td>
  		<a href="bbsReply_delete.jsp?idx=<%=Rsabun%>&dnum=<%=Rnum%>">[del]</a>
  		<a href="javascript:void(0);" onclick="re_edit(<%=Rnum%>, '<%=Rwriter%>', '<%=Rcontent%>');">[edit]</a> 
  	</td>
  </tr>
  <% 
 }
  %>
 </table>	
 
 <p style="margin-bottom:150px">
 <p><br>
</body>
</html>






