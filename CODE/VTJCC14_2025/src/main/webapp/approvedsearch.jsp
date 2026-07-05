<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ page import="java.util.Base64"%>

<%
    /* ===== SESSION VALIDATION ===== */
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
<title>Approved Search | Cloud Security Portal</title>

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
	background: url('<%= request.getContextPath() %>/images/vtjcc14.jpg')
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

/* ================= TOP NAV ================= */
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

/* ================= SESSION BUBBLE ================= */
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
translate(
-50%
,
-10px
);
}
100
%
{
transform
:
translate(
-50%
,
0
);
}
}

/* ================= SEARCH / RESULT CARD ================= */
.approved-wrapper {
	position: relative;
	z-index: 1;
	margin: 200px auto;
	width: 800px;
	padding: 35px;
	border-radius: 22px;
}

.approved-wrapper h2 {
	text-align: center;
	color: #e8f4ff;
	margin-bottom: 25px;
}

/* ================= INPUT ================= */
input[type="text"] {
	width: 100%;
	padding: 14px;
	border-radius: 14px;
	border: 1px solid rgba(255, 255, 255, 0.35);
	background: rgba(255, 255, 255, 0.15);
	color: #fff;
	outline: none;
	margin-bottom: 15px;
}

/* ================= LABEL ================= */
.label {
	color: #9fd3ff;
	font-weight: 600;
	margin-top: 15px;
	display: block;
}

/* ================= TEXTAREA ================= */
textarea {
	width: 100%;
	padding: 14px;
	margin-top: 8px;
	border-radius: 14px;
	border: 1px solid rgba(255, 255, 255, 0.35);
	background: rgba(255, 255, 255, 0.12);
	color: #fff;
	resize: none;
}

/* ================= BUTTON ================= */
button {
	width: 100%;
	margin-top: 22px;
	padding: 14px;
	border-radius: 16px;
	border: none;
	background: linear-gradient(135deg, #4aa3ff, #2b6fff);
	color: #fff;
	font-size: 16px;
	font-weight: 700;
	cursor: pointer;
	transition: 0.3s;
}

button:hover {
	transform: translateY(-3px);
	box-shadow: 0 0 18px rgba(120, 190, 255, 0.6);
}

/* ================= ERROR ================= */
.error {
	color: #ff9f9f;
	margin-top: 10px;
	text-align: center;
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

	<!-- ===== HEADER ===== -->
	<div class="header-bar glass">
		<h1>Approved File Access</h1>
	</div>

	<!-- ===== TOP NAV ===== -->
	<div class="top-nav glass">
	    <a href="user_login_dashboard.jsp">Home</a>
	    <a href="user_search.jsp">Search</a>
	    <a href="approvedsearch.jsp">Approved Search</a>
	    <a href="user_login.jsp">Logout</a>
	</div>

	<!-- ===== SESSION BUBBLE ===== -->
	<div class="session-bubble">
		<span>User : <%= userEmail %></span>
	</div>

	<!-- ===== APPROVED SEARCH CARD ===== -->
	<div class="approved-wrapper glass">
		<h2>Approved Search</h2>

		<form action="ApprovedSearchServlet" method="post">
			<input type="text" name="custom_filename"
				placeholder="Enter Custom Filename" required>
			<button type="submit">Search</button>
		</form>

		<div class="error">${error}</div>

		<% if (request.getAttribute("private_key") != null) { %>

		<span class="label">File Name</span>
		<textarea rows="1" readonly>${file_name}</textarea>

		<span class="label">SHA-256</span>
		<textarea rows="2" readonly>${sha256}</textarea>

		<span class="label">Private Key (Shared by Admin)</span>
		<textarea rows="4" readonly>${private_key}</textarea>

		<form action="DownloadFileServlet" method="post">
			<input type="hidden" name="custom_filename"
				value="${param.custom_filename}">
			<button type="submit">Download File</button>
		</form>

		<% } %>
	</div>

	<!-- ===== FOOTER ===== -->
	<div class="footer glass">© 2025 Cloud Security Framework |
		Approved Secure Access</div>

</body>
</html>
