<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.DB.Database" %>

<%
    /* ===== SESSION VALIDATION ===== */
    String ownerEmail = (String) session.getAttribute("ownerEmail");
    if (ownerEmail == null) {
        response.sendRedirect("owner_login.jsp");
        return;
    }
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Access Requests | Cloud Security Portal</title>

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
    background: rgba(0,0,0,0.55);
    z-index: 0;
}

/* ================= GLASS ================= */
.glass {
    background: rgba(255,255,255,0.08);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(255,255,255,0.18);
    box-shadow:
        inset 0 0 20px rgba(255,255,255,0.05),
        0 0 25px rgba(120,190,255,0.15);
}

/* ================= HEADER ================= */
.header-bar {
    position: fixed;
    top: 0;
    width: 100%;
    padding: 18px 40px;
    text-align: center;
    z-index: 10;
}

.header-bar h1 {
    font-size: 26px;
    color: #e8f4ff;
    text-shadow: 0 0 15px rgba(120,190,255,0.5);
}

/* ================= TOP NAV ================= */
.top-nav {
    position: fixed;
    top: 72px;
    width: 100%;
    padding: 14px 40px;
    display: flex;
    justify-content: center;
    z-index: 9;
}

.top-nav a {
    color: #e8f4ff;
    margin: 0 24px;
    font-size: 16px;
    text-decoration: none;
}

.top-nav a:hover {
    color: #9fd3ff;
    text-shadow: 0 0 10px rgba(120,190,255,0.8);
}

/* ================= CONTENT ================= */
.content {
    margin-top: 160px;
    padding: 40px;
    display: flex;
    justify-content: center;
    z-index: 1;
}

/* ================= TABLE CARD ================= */
.table-card {
    width: 85%;
    padding: 35px;
    border-radius: 26px;
}

/* ================= TITLE ================= */
.table-card h2 {
    text-align: center;
    font-size: 28px;
    color: #e8f4ff;
    margin-bottom: 25px;
    text-shadow: 0 0 12px rgba(120,190,255,0.5);
}

/* ================= TABLE ================= */
table {
    width: 100%;
    border-collapse: collapse;
}

th, td {
    padding: 14px;
    text-align: center;
    color: #d6ecff;
}

th {
    font-size: 15px;
    text-transform: uppercase;
    letter-spacing: 1px;
    background: rgba(255,255,255,0.12);
}

tr {
    transition: 0.3s;
}

tr:hover {
    background: rgba(255,255,255,0.08);
}
/* ================= SESSION BUBBLE ================= */
.session-bubble {
    position: fixed;
    top: 118px;
    left: 50%;
    transform: translateX(-50%);
    padding: 8px 18px;
    border-radius: 25px;
    font-size: 14px;
    color: #e8f4ff;
    z-index: 9;

    background: rgba(255,255,255,0.12);
    backdrop-filter: blur(15px);
    border: 1px solid rgba(255,255,255,0.25);

    animation: float 4s ease-in-out infinite;
}

@keyframes float {
    0% { transform: translate(-50%, 0); }
    50% { transform: translate(-50%, -8px); }
    100% { transform: translate(-50%, 0); }
}

/* ================= BUTTON ================= */
button {
    padding: 8px 18px;
    border-radius: 14px;
    border: none;
    background: linear-gradient(135deg, #4aa3ff, #2b6fff);
    color: #fff;
    font-weight: 600;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    transform: translateY(-2px);
    box-shadow: 0 0 15px rgba(120,190,255,0.7);
}

/* ================= FOOTER ================= */
/* .footer {
	
    margin-top: 335px;
    text-align: center;
    color: #cfe8ff;
    font-size: 13px;
} */
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
    <h1>Securing Cloud Systems with Smart Authentication and Adaptive Encryption</h1>
</div>

<!-- ===== TOP NAV ===== -->
<div class="top-nav glass">
    <a href="owner_login_dashboard.jsp">Home</a>
    <a href="upload.jsp">Upload</a>
    <a href="owner_requests.jsp">Requests</a>
</div>
<div class="session-bubble glass">
    Owner : <strong><%= ownerEmail %></strong>
</div>
<!-- ===== CONTENT ===== -->
<div class="content">
    <div class="table-card glass">

        <h2>User Access Requests</h2>

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
                    "SELECT * FROM access_requests WHERE request_status='PENDING'"
                );
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("user_email") %></td>
                <td><%= rs.getString("custom_filename") %></td>
                <td>PENDING</td>
                <td>
                    <form action="OwnerApproveRequestServlet" method="post">
                        <input type="hidden" name="requestId" value="<%= rs.getInt("id") %>">
                        <button type="submit">Approve</button>
                    </form>
                </td>
            </tr>
            <% } %>
        </table>

    </div>
</div>

<!-- ===== FOOTER ===== -->
<div class="footer glass">
    © 2025 Cloud Security Framework | Smart Authentication & Adaptive Encryption
</div>

</body>
</html>
