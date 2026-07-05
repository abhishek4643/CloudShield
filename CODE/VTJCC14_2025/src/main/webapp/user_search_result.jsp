<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Base64"%>
<%@ page isELIgnored="false"%>

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
<title>Search Result | Cloud Security Portal</title>

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

/* ================= RESULT CARD ================= */
.result-wrapper {
	position: relative;
	z-index: 1;
	margin: 200px auto;
	width: 800px;
	padding: 35px;
	border-radius: 22px;
}

.result-wrapper h2 {
	text-align: center;
	color: #e8f4ff;
	margin-bottom: 30px;
}

/* ================= LABELS ================= */
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
	margin-top: 25px;
	width: 100%;
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
		<h1>User Search Result</h1>
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

	<!-- ===== RESULT CARD ===== -->
	<div class="result-wrapper glass">
		<h2>Search Result</h2>

		<span class="label">Custom Filename</span>
		<textarea rows="1" readonly>${custom_filename}</textarea>

		<span class="label">SHA-256</span>
		<textarea rows="2" readonly>${sha256}</textarea>

		<span class="label">Public Key</span>
		<textarea rows="4" readonly>${public_key}</textarea>

		<span class="label">Encrypted Data (Preview)</span>
		<textarea rows="4" readonly>
<%
    byte[] data = (byte[]) request.getAttribute("encrypted_data");
    if (data != null) {
        out.print(Base64.getEncoder().encodeToString(data).substring(0, 120) + "...");
    }
%>
    </textarea>

		<form action="RequestAccessServlet" method="post">
			<input type="hidden" name="fid" value="${fid}"> <input
				type="hidden" name="custom_filename" value="${custom_filename}">
			<button type="submit">Request Owner Approval</button>
		</form>
	</div>

	<!-- ===== FOOTER ===== -->
	<div class="footer glass">© 2025 Cloud Security Framework |
		Secure Data Access</div>

</body>
</html>
