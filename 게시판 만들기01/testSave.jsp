<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>  <!-- 이거랑 밑에꺼는 ssi.jsp에다가 적용시켜놔도됨 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>testSave.jsp</title>
  
   <style type="text/css">
     *{font-size:16pt;}
     a{font-size:16pt; text-decoration:none; font-weight:bold; color:blue;  font-family: Comic Sans MS ; }
     a:hover{font-size:20pt; text-decoration:underline; color:green;  font-family: Comic Sans MS ; }
   </style>
   
   <script type="text/javascript">
   </script>
</head>
<body>
<h2> testSave.jsp </h2>
<%
/*      String a = request.getParameter("title");
     int b = Integer.parseInt(request.getParameter("pay"));
     String c = request.getParameter("gender");
     String d = request.getParameter("file1");
     out.println("넘어온 제목 = " + a + "<br>");
     out.println("넘어온 급여 = " + b + "<br>");
     out.println("넘어온 성별 = " + c + "<br>");
     out.println("넘어온 파일 = " + d + "<br>"); */
     
     String path = application.getRealPath("storage");
     System.out.println("공용저장경로 = " + path);
     
     int size = 1024 * 1024 + 7;
     DefaultFileRenamePolicy dr = new DefaultFileRenamePolicy();
     MultipartRequest mr = new MultipartRequest(request, path, size, "UTF-8");  
     //request 내장개체, 경로, 사이즈, 인코딩(UTF-8)   -> 생성자가 4개. 혹은 5개
     
     String a = mr.getParameter("title");
     int b = Integer.parseInt(mr.getParameter("pay"));
     String c = mr.getParameter("gender");
     String d = mr.getFilesystemName("file1");  
     //이미지 저장을 위해 해야할게 있음 getParameter메소드가 아닌 getFilesystemName("file1") 필요
     out.println("넘어온 제목 = " + a + "<br>");
     out.println("넘어온 급여 = " + b + "<br>");
     out.println("넘어온 성별 = " + c + "<br>");
     out.println("넘어온 파일 = " + d + "<br>");
     
 try{
     msg = "insert into test values(test_seq.nextval, ?, ?, sysdate, ?, ?)";  //(code, title, pay, wdate, gender, img_file_name)
     PST = CN.prepareStatement(msg);
      //code는 seq 값으로 wdate 대체
       PST.setString(1, a);
       PST.setInt(2, b);
       PST.setString(3, c);
       PST.setString(4, d);
     PST.executeUpdate();
     System.out.println("testSave.jsp test 테이블 데이터 저장 성공했습니다.");
 }catch(Exception ex){System.out.println("testSave.jsp 문서 저장에러이유:" + ex.toString());}
%>	

 <p>
 <a href="testWrite.jsp">[testWrite]</a>
 <a href="testList.jsp">[testList]</a>
 <a href="#">[index]</a>	
</body>
</html>