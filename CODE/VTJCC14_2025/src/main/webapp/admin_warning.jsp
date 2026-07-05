<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>

<%
String adminEmail = (String) session.getAttribute("username");
if (adminEmail == null) {
	response.sendRedirect("index.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Security Warnings | Cloud Security Portal</title>

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
	min-height: 100vh;
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

/* ================= GLASS ================= */
.glass {
	background: rgba(255, 255, 255, 0.08);
	backdrop-filter: blur(20px);
	border: 1px solid rgba(255, 255, 255, 0.18);
	box-shadow: inset 0 0 20px rgba(255, 255, 255, 0.05), 0 0 25px
		rgba(120, 190, 255, 0.15);
}

/* ================= HEADER ================= */
.header-bar {
	position: fixed;
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

/* ================= NAV ================= */
.top-nav {
	position: fixed;
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

/* ================= SESSION ================= */
.session-bubble {
	position: fixed;
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
	gap: 8px;
	animation: floatBubble 4s ease-in-out infinite;
}

.session-bubble span {
	color: #9fd3ff;
	font-weight: 600;
}

@
keyframes floatBubble { 0%{
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

/* ================= TABLE ================= */
.table-wrapper {
	position: relative;
	z-index: 1;
	margin: 190px auto 40px;
	width: 90%;
	padding: 30px;
	border-radius: 22px;
}

table {
	width: 100%;
	border-collapse: collapse;
	color: #e8f4ff;
}

th {
	background: rgba(255, 70, 70, 0.35);
	padding: 14px;
	text-transform: uppercase;
	letter-spacing: 1px;
}

td {
	padding: 14px;
	text-align: center;
}

tr {
	border-bottom: 1px solid rgba(255, 255, 255, 0.15);
}

/* ================= STATUS ================= */
.status-unread {
	color: #ff5e5e;
	font-weight: 700;
	text-shadow: 0 0 8px rgba(255, 80, 80, 0.8);
}

.status-read {
	color: #7CFF9B;
	font-weight: 700;
}

/* ================= FOOTER ================= */
.footer {
	position: fixed;
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

	<!-- HEADER -->
	<div class="header-bar glass">
		<h1>Cloud Security Administration & Threat Monitoring</h1>
	</div>

	<!-- NAV -->
	<div class="top-nav glass">
		<a href="admin_login_dashboard.jsp">Home</a> <a
			href="admin_user_approval.jsp">User Approvals</a> <a
			href="admin_requests.jsp">Search Requests</a> <a
			href="view_owners.jsp">Owner Details</a> <a href="view_users.jsp">User
			Details</a> <a href="AdminWarningServlet">Warning Message</a>
	</div>

	<!-- SESSION -->
	<div class="session-bubble">
		<span>Admin : <%=adminEmail%></span>
	</div>

	<!-- TABLE -->
	<div class="table-wrapper glass">

		<h2 style="text-align: center; margin-bottom: 25px;">⚠ Security
			Warning Messages</h2>

		<table>

			<tr>
				<th>User Email</th>
				<th>IP Address</th>
				<th>Attempt Time</th>
				<th>Status</th>
			</tr>

			<%
			ArrayList<String[]> warnings = (ArrayList<String[]>) request.getAttribute("warnings");

			if (warnings != null) {
				for (String[] w : warnings) {
					String status = w[3];
			%>

			<tr>
				<td><%=w[0]%></td>
				<td><%=w[1]%></td>
				<td><%=w[2]%></td>

				<td
					class="<%="UNREAD".equals(status) ? "status-unread" : "status-read"%>">
					<%=status%>
				</td>

			</tr>

			<%
			}
			}
			%>

		</table>
	</div>

	<!-- FOOTER -->
	<div class="footer glass">© 2025 Cloud Security Framework | Admin
		Control Panel</div>

</body>
</html>
