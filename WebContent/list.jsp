<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, dataAccessObject.*, valueObject.ChallengerVO, valueObject.ParentVO, constants.Constants"
	pageEncoding="UTF-8"%>
<%
System.out.println(":: list.jsp");
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
  <title>list</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://kit.fontawesome.com/a4d2993e00.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="css/list.css">
</head>
<body>

	<!-- Navigation Bar -->
	<div class="topnav" id="myTopnav">
		<a href="main.html" class="active">챌린저스</a> 
		<a href="list.jsp">리스트</a> 
		<a href="profile.jsp">프로필</a> 
		<a href="main.html#footer">About</a> 
		<a href="javascript:void(0);" class="icon" onclick="myFunction()"> <i class="fa fa-bars"></i></a>
	</div>

	<!-- list group -->
	<div class="list_group">
		<div class="list-group">
			<%
			for (ParentVO parentVO : dao.getList(ChallengerVO.class, Constants.Challenger_getList)) {
			%>
			<a href="feed.jsp?CHALLENGER_ID=<%=((ChallengerVO) parentVO).getId()%>" class="list-group-item list-group-item-action">
				<%=((ChallengerVO) parentVO).getName()%> </a>
			<%
			}
			%>
		</div>
	</div>
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