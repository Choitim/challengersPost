<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, dataAccessObject.*, valueObject.*, constants.Constants"
	pageEncoding="UTF-8"%>
<%
System.out.println(":: feed.jsp");
System.out.println("isLogOn: " + session.getAttribute("isLogOn"));
System.out.println("user_#: " + session.getAttribute("user_#"));
System.out.println();

if (session.getAttribute("isLogOn")!=null) {
	if (!(boolean)session.getAttribute("isLogOn"))
		response.sendRedirect("index.html");
} else response.sendRedirect("index.html");
%>

<%
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("CHALLENGER_ID");
System.out.println(id);
DAO dao = new DAO();
// ChallengerVO challengerVO = (ChallengerVO) dao.getAList(new String[] {id}, ChallengerVO.class, Constants.Challenger_getChallengerInfo);
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://kit.fontawesome.com/a4d2993e00.js" crossorigin="anonymous"></script>
  <title>Feed</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="css/feed.css">
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

  <div class="share_btn">
    <a href="add.jsp?CHALLENGER_ID=<%= id %>"><i class="fa-solid fa-square-plus"></i></a>
  </div>
  <br>

	<section class="main_feed">
<center>
		<%for (ParentVO parentVO : dao.getList(new String[]{id}, FeedVO.class, Constants.Feed_getList)) {%>
		<div class="student_name">
			<p>
				<%ParentVO userInfo = dao.getList(new String[]{((FeedVO) parentVO).getUserNum()}, UserVO.class, Constants.User_info).firstElement();%>
				<%=((UserVO) userInfo).getName()%> <%=((UserVO) userInfo).getMajor()%> <%=((FeedVO) parentVO).getUploadTime().substring(5, ((FeedVO) parentVO).getUploadTime().length()-3)%>
				
				<%if(((String)session.getAttribute("user_#")).equals(((FeedVO) parentVO).getUserNum())) {%>
				<form method="get" action="DELETE">
					<input type="submit" value="삭제">
					<input type="hidden" name="CHALLENGE_ID" value="<%=((FeedVO) parentVO).getFeed_id()%>">
					<input type="hidden" name="USER_#" value="<%=((FeedVO) parentVO).getUserNum()%>">
					<input type="hidden" name="FILENAME" value="<%=((FeedVO) parentVO).getFileName()%>">
					<input type="hidden" name="UPLOADTIME" value="<%=((FeedVO) parentVO).getUploadTime()%>">
					<input type="hidden" name="DESTINATION" value="feed.jsp?CHALLENGER_ID=<%= id %>">
				</form>
				<%} %>
			</p>
		</div>
		<div class="card" style="width: 20rem;">
				<%
				String filename=((FeedVO)parentVO).getFileName();
				if(filename==null) %><img src="img/Challengers Logo -2.png" class="card-img-top" alt="..."><%
				else{
				if(filename.contains("jpeg")||filename.contains("svg")||filename.contains("jpg")||filename.contains("png")||filename.contains("jfif")) {
					%><img src="files/<%=filename%>" class="card-img-top" alt="..."><%
				} else if(filename.contains("https")){%> <%
				if(!filename.contains(", ")){%>
				<input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=filename %>'">
				<%} else {
					String temp ="";
					for(int i=0; i<filename.length(); i++)
						if(filename.charAt(i)==','){
							%><input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=temp %>'"><%
							temp="";
						} else temp =temp+filename.charAt(i);
					%><input type="button" style="width: 99%; margin-top:1px; background: #56B7E6; border-width: 0.5px;" value="->" onClick="location.href='<%=temp %>'"><%
				}} else{
					%><video src="files/<%=filename%>"width="320" height="240" controls class="card-img-top"></video><%
				}}%>
				<div class="card-body">
				<p class="card-text"><%=((FeedVO) parentVO).getText()%></p>
			</div>
		</div>
		<hr>
		<%}%>
</center>
	</section>

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