<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title></title>
  
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
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>

	<img src="images/222.jpg" width="100%" height="90"> <p>
<% 
String name =(String)session.getAttribute("naver");
%>
</body>
</html>