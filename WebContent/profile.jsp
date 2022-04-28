<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, dataAccessObject.*, valueObject.ChallengerVO, valueObject.ParentVO, constants.Constants"
	pageEncoding="UTF-8"%>

<%
System.out.println(":: profile.jsp");
System.out.println("isLogOn: " + session.getAttribute("isLogOn"));
System.out.println("user_#: " + session.getAttribute("user_#"));
System.out.println();

if (session.getAttribute("isLogOn") != null) {
	if (!(boolean) session.getAttribute("isLogOn"))
		response.sendRedirect("index.html");
} else
	response.sendRedirect("index.html");
%>
<%
DAO dao = new DAO();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>profile</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/a4d2993e00.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/profile.css">
</head>
<body>
  <!-- Navigation Bar -->
  <div class="topnav" id="myTopnav">
    <a href="main.html" class="active">챌린저스</a>
    <a href="list.jsp">리스트</a>
    <a href="profile.jsp">프로필</a>
    <a href="main.html#footer">About</a>
    <a href="javascript:void(0);" class="icon" onclick="myFunction()">
      <i class="fa fa-bars"></i>
    </a>
  </div>

  <!-- main Profile section -->
  <section class="name_helloSection">
    <div class="name_studentHello">
      <p>안녕하세요 <div class="server_studentName" id="server_studentName"><%= session.getAttribute("user_name") %>님</div></p>
    </div>
  </section>

  <section>
    <div class="successrate">
      <p>이번 챌린지 성공률</p>
      <div class="progress" style="height: 50px;">
      <% 
      String rate = dao.get((String)session.getAttribute("user_#"), Constants.User_Rate); 
      System.out.println(rate);
      %>
        <div class="progress-bar" role="progressbar" style="width:<%=rate%>%;" aria-valuenow="<%=rate%>" aria-valuemin="0" aria-valuemax="100"><%=rate%></div>
      </div>
    </div>
  </section>

  <!-- 포스트 할때 마다 체크 표시가 늘어나게 하기 (html에서는 작동안하는 웹이 존재함) react로 작업 -->
  <section>
    <div class="check_success"></div>
  </section>

  <!-- button group -->
  <form action="PROFILE" method="get">
    <div class="d-grid gap-2 col-6 mx-auto">
    <input class="btn btn-primary" type="submit" name="logout" value="Logout"/>
      <button class="btn btn-primary" type="submit" disabled="disabled">회원탈퇴</button>
    </div>
  </form>

</body>

<script>
  /* Toggle BTN on Nav Bar */
  function myFunction() {
    var x = document.getElementById("myTopnav");
    if (x.className === "topnav") {
      x.className += " responsive";
    } else {
      x.className = "topnav";
    }
  }
</script>

</html>