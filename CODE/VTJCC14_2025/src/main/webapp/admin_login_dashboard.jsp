<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
/* ===== SESSION VALIDATION ===== */
String adminEmail = (String) session.getAttribute("username");
if (adminEmail == null) {
	response.sendRedirect("admin_login_dashboard.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard | Cloud Security Portal</title>

<style>
/* ================= RESET ================= */
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Segoe UI", sans-serif;
}

/* ================= BODY ================= */
body {
	height: 100vh;
	overflow: hidden;
	background: url('<%=request.getContextPath()%>/images/vtjcc14.jpg')
		no-repeat center center/cover;
	position: relative;
}

/* ================= DARK OVERLAY ================= */
body::before {
	content: "";
	position: fixed;
	inset: 0;
	background: rgba(0, 0, 0, 0.55);
	z-index: 0;
}

/* ================= GLASS BASE ================= */
.glass {
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(20px);
	-webkit-backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	box-shadow: inset 0 0 20px rgba(255, 255, 255, 0.05), 0 0 25px
		rgba(120, 190, 255, 0.15);
}

/* ================= HEADER ================= */
.header-bar {
	position: absolute;
	top: 0;
	width: 100%;
	padding: 16px 40px;
	text-align: center;
	z-index: 10;
}

.header-bar h1 {
	font-size: 24px;
	color: #e8f4ff;
	text-shadow: 0 0 15px rgba(120, 190, 255, 0.5);
}

/* ================= TOP NAV ================= */
.top-nav {
	position: absolute;
	top: 62px;
	width: 100%;
	padding: 12px 40px;
	display: flex;
	justify-content: center;
	z-index: 9;
}

.top-nav a {
	color: #e8f4ff;
	margin: 0 22px;
	font-size: 15px;
	text-decoration: none;
	transition: 0.3s;
}

.top-nav a:hover {
	color: #9fd3ff;
	text-shadow: 0 0 10px rgba(120, 190, 255, 0.8);
}

/* ================= SESSION BUBBLE ================= */
.session-bubble {
	position: absolute;
	top: 110px;
	left: 50%;
	transform: translateX(-50%);
	padding: 10px 20px;
	border-radius: 30px;
	z-index: 9;
	background: rgba(255, 255, 255, 0.12);
	backdrop-filter: blur(18px);
	border: 1px solid rgba(255, 255, 255, 0.25);
	font-size: 14px;
	color: #e8f4ff;
	display: flex;
	align-items: center;
	gap: 8px;
	animation: floatBubble 4s ease-in-out infinite;
	box-shadow: 0 0 18px rgba(120, 190, 255, 0.35), inset 0 0 12px
		rgba(255, 255, 255, 0.15);
}

.session-bubble span {
	color: #9fd3ff;
	font-weight: 600;
}

@
keyframes floatBubble { 0% {
	transform: translate(-50%, 0);
}

50


%
{
transform


:


translate
(


-50
%
,
-10px


)
;


}
100


%
{
transform


:


translate
(


-50
%
,
0


)
;


}
}

/* ================= MAIN CONTENT ================= */
.page-content {
	position: absolute;
	top: 160px;
	bottom: 70px;
	width: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	z-index: 1;
}

/* ================= OPTIONS ================= */
.options-container {
	display: flex;
	gap: 40px;
}

/* ================= GLASS CARD ================= */
.container-box {
	width: 260px;
	height: 150px;
	cursor: pointer;
	border-radius: 22px;
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(18px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 20px;
	font-weight: 600;
	color: #e8f4ff;
	letter-spacing: 1px;
	text-shadow: 0 0 10px rgba(120, 190, 255, 0.4);
	transition: all 0.35s ease;
}

.container-box:hover {
	transform: translateY(-10px) scale(1.05);
	box-shadow: 0 0 30px rgba(120, 190, 255, 0.4), inset 0 0 25px
		rgba(255, 255, 255, 0.08);
}

/* ================= FOOTER ================= */
.footer {
	position: absolute;
	bottom: 0;
	width: 100%;
	padding: 14px;
	text-align: center;
	font-size: 13px;
	color: #cfe8ff;
	z-index: 10;
}
</style>
</head>

<body>

	<!-- ===== HEADER ===== -->
	<div class="header-bar glass">
		<h1>Cloud Security Administration & Access Control</h1>
	</div>

	<!-- ===== TOP NAV ===== -->
	<div class="top-nav glass">
		<a href="admin_login_dashboard.jsp">Home</a> <a
			href="admin_user_approval.jsp">User Approvals</a> <a
			href="admin_requests.jsp">Search Requests</a> <a
			href="view_owners.jsp">Owner Details</a> <a href="view_users.jsp">User
			Details</a> <a href="AdminWarningServlet">Warning Message</a> <a
			href="index.jsp">logout</a>
	</div>

	<!-- ===== SESSION BUBBLE ===== -->
	<div class="session-bubble">
		<span>Admin : <%=adminEmail%></span>
	</div>

	<!-- ===== MAIN CONTENT ===== -->
	<div class="page-content">
		<div class="options-container">


			<div class="container-box"
				onclick="location.href='admin_user_approval.jsp'">User
				Approval</div>

			<div class="container-box"
				onclick="location.href='admin_requests.jsp'">Search Requests</div>

			<div class="container-box" onclick="location.href='view_owners.jsp'">
				Owner Details</div>

			<div class="container-box" onclick="location.href='view_users.jsp'">
				User Details</div>

			<div class="container-box"
				onclick="location.href='AdminWarningServlet'">Warning Message
			</div>

		</div>
	</div>

	<!-- ===== FOOTER ===== -->
	<div class="footer glass">© 2025 Cloud Security Framework | Admin
		Control Panel</div>

</body>
</html>
