<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<%
    String userEmail = (String) session.getAttribute("userEmail");
    if (userEmail == null) {
        response.sendRedirect("user_login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Request Sent | Cloud Security Portal</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Segoe UI", sans-serif;
}

body {
	min-height: 100vh;
	background: url('<%= request.getContextPath() %>/images/vtjcc14.jpg')
		no-repeat center center/cover;
	position: relative;
}

body::before {
	content: "";
	position: fixed;
	inset: 0;
	background: rgba(0, 0, 0, 0.55);
	z-index: 0;
}

.glass {
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	box-shadow: 0 0 25px rgba(120, 190, 255, 0.2);
}

.message-box {
	position: relative;
	z-index: 1;
	margin: 220px auto;
	width: 520px;
	padding: 40px;
	border-radius: 26px;
	text-align: center;
}

.message-box h2 {
	color: #9fd3ff;
	margin-bottom: 20px;
}

.message-box p {
	color: #e8f4ff;
	font-size: 16px;
	line-height: 1.6;
}

button {
	margin-top: 25px;
	padding: 14px 26px;
	border-radius: 16px;
	border: none;
	background: linear-gradient(135deg, #4aa3ff, #2b6fff);
	color: #fff;
	font-size: 15px;
	font-weight: 700;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	transform: translateY(-3px);
	box-shadow: 0 0 18px rgba(120, 190, 255, 0.6);
}
</style>
</head>

<body>

	<div class="message-box glass">
		<h2>Request Submitted</h2>
		<p>${message}</p>

		<button onclick="location.href='user_login_dashboard.jsp'">
			Back to Dashboard</button>
	</div>

</body>
</html>
