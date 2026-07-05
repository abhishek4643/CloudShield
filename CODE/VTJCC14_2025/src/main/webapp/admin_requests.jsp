<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DB.Database" %>

<%
    /* ===== SESSION VALIDATION ===== */
    String adminEmail = (String) session.getAttribute("username");
    if (adminEmail == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Key Sharing | Cloud Security Portal</title>

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
                no-repeat center center / cover;
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
    box-shadow:
        inset 0 0 20px rgba(255, 255, 255, 0.05),
        0 0 25px rgba(120, 190, 255, 0.15);
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
    box-shadow:
        0 0 18px rgba(120, 190, 255, 0.35),
        inset 0 0 12px rgba(255, 255, 255, 0.15);
}

.session-bubble span {
    color: #9fd3ff;
    font-weight: 600;
}

@keyframes floatBubble {
    0%   { transform: translate(-50%, 0); }
    50%  { transform: translate(-50%, -10px); }
    100% { transform: translate(-50%, 0); }
}

/* ================= TABLE CONTAINER ================= */
.table-wrapper {
    position: relative;
    z-index: 1;
    margin: 190px auto 40px;
    width: 90%;
    padding: 30px;
    border-radius: 22px;
}

/* ================= TABLE ================= */
table {
    width: 100%;
    border-collapse: collapse;
    color: #e8f4ff;
}

th {
    background: rgba(255,255,255,0.15);
    padding: 14px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

td {
    padding: 14px;
    text-align: center;
}

tr {
    border-bottom: 1px solid rgba(255,255,255,0.15);
}

/* ================= BUTTON ================= */
button {
    padding: 8px 18px;
    border-radius: 14px;
    border: none;
    background: linear-gradient(135deg, #4aa3ff, #2b6fff);
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    transform: scale(1.08);
    box-shadow: 0 0 15px rgba(120, 190, 255, 0.6);
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
    <h1>Cloud Security Administration & Key Sharing</h1>
</div>

<!-- ===== TOP NAV ===== -->
<div class="top-nav glass">
    <a href="admin_login_dashboard.jsp">Home</a>
    <a href="admin_user_approval.jsp">User Approvals</a>
    <a href="admin_requests.jsp">Search Requests</a>
    <a href="view_owners.jsp">Owner Details</a>
    <a href="view_users.jsp">User Details</a>
    <a href="AdminWarningServlet">Warning Message</a>
    
</div>

<!-- ===== SESSION BUBBLE ===== -->
<div class="session-bubble">
    <span>Admin : <%= adminEmail %></span>
</div>

<!-- ===== TABLE ===== -->
<div class="table-wrapper glass">
    <h2 style="text-align:center; margin-bottom:25px;">Owner Approved Requests</h2>

    <table>
        <tr>
            <th>User Email</th>
            <th>Filename</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
            Connection con = Database.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM access_requests WHERE request_status='OWNER_APPROVED'"
            );
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getString("user_email") %></td>
            <td><%= rs.getString("custom_filename") %></td>
            <td>OWNER APPROVED</td>
            <td>
                <form action="AdminShareKeyServlet" method="post">
                    <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                    <button type="submit">Share Private Key</button>
                </form>
            </td>
        </tr>
        <% } %>
    </table>
</div>

<!-- ===== FOOTER ===== -->
<div class="footer glass">
    © 2025 Cloud Security Framework | Admin Control Panel
</div>

</body>
</html>
