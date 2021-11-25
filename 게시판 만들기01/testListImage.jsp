<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> testListImage.jsp </title>

 <style type="text/css">
   *{ font-size: 16pt; font-weight: bold; }
   a{ font-size: 16pt; text-decoration: none;  font-family: Comic Sans MS; }
   a:hover{ font-size: 20pt; text-decoration: underline; }
   .my{ font-size: 15pt;  font-weight: bold;}
   table{
		width: 1200px; 
		border: 1px solid gainsboro;
		border-collapse: collapse;  /* 테두리 사이 간격 없애고 싶을 때 사용 */
	}
	.tb_img{
		height: 200px; 
		width: 230px; 
		padding-top: 15px;
		padding-left: 3.5px;
	  	display: flex;   /* 이 줄 포함 밑으로 3개 -> div 내에서 가운데 정렬 */
  		justify-content: center;
  		align-items: center; 
	}
	.tb_title{
		height: 40px; 
		text-align: center; 
		margin-top: 10px; 
	  	display: flex;   /* 이 줄 포함 밑으로 3개 -> div 내에서 가운데 정렬 */
  		justify-content: center;
  		align-items: center; 
		background-color: mistyrose;
		padding: 3px;
	}
	td{
		border: 1px solid gainsboro;
	}
 </style>
 
 <script type="text/javascript">
 </script> 
</head>
<body>

<%!
 //전역변수 선언
 String Ggender,Gimage;
%>

<%
 msg="select count(*) as cnt from test "; 
 RS=ST.executeQuery(msg); 
 if(RS.next()==true){ Gtotal = RS.getInt("cnt"); }
%>
 <p style="margin-top:0px;"> 
  
 <table>
   testListImage.jsp 레코드갯수: <%= Gtotal %> &nbsp;<p>
 <tr>
 <%
 try{
   //testListImage.jsp문서이미지게시판 구현   1행에 5개그림열출력 
   int i=0;
   msg = "select * from test  order by title asc" ;  //asc생략가능해요
   RS = ST.executeQuery( msg ); //RS=~~~(); 기술하면 우리는 RS.next()필수기술 
   while(RS.next()==true){
  	 Gtitle = RS.getString("title");
  	 Gpay = RS.getInt("pay");
  	 Ggender = RS.getString("gender");
  	 Gwdate = RS.getDate("wdate");
  	 Gcode = RS.getInt("code");  
  	 Gimage = RS.getString("img_file_name"); 
  	 if(i%5==0){ //System.out.println() 1~30출력 5개씩출력참고
 %>
   <tr></tr>
<%  } %>
  	<td> 
  	<div class="tb_img"> 
  	 <a href="testDetail.jsp?idx=<%=Gcode%>"> 
  	  <img src="<%=request.getContextPath()%>/storage/<%=Gimage%>" width= "190px"  height = "190px"  
  	       onMouseOver="this.width=this.width*1.15; this.height=this.height*1.15"  
  	       onMouseOut="this.width=this.width/1.15; this.height=this.height/1.15">
  	 </a>
  	 </div>
  	 <div class="tb_title">
  	    <span class="my">상품: <%= Gtitle %>&emsp;</span>  
  	    <span class="my">가격: <%= Gpay %></span>
	 </div>    
  	</td>	 
 <%  	
   i=i+1;  //1씩증가 
   }//while end
 }catch(Exception ex){ System.out.println("조회에러 " + ex.toString());}
 %> 
  </tr>	
 </table>
  

  <p>  <!-- testListImage.jsp -->
  <a href="testWrite.jsp">[testWrite]</a>
  <a href="testList.jsp">[testList]</a>
  <a href="#">[index]</a>
  <a href="login.jsp">[로그인]</a>
</body>

</html>






