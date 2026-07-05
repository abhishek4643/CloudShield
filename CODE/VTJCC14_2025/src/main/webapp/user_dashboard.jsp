<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Access | Cloud Security Portal</title>

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
    height: 100vh;            /* FIXED HEIGHT */
    overflow: hidden;         /* NO SCROLLBAR */
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

/* ================= HEADER BAR ================= */
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

/* ================= TOP NAV BAR ================= */
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

/* ================= MAIN CONTENT ================= */
.page-content {
    position: absolute;
    top: 130px;     /* below header + nav */
    bottom: 70px;   /* above footer */
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
    -webkit-backdrop-filter: blur(18px);
    border: 1px solid rgba(255, 255, 255, 0.18);

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 22px;
    font-weight: 600;
    color: #e8f4ff;
    letter-spacing: 1px;
    text-shadow: 0 0 10px rgba(120, 190, 255, 0.4);

    position: relative;
    transition: all 0.35s ease;
}

/* gradient border */
.container-box::before {
    content: "";
    position: absolute;
    inset: 0;
    border-radius: 22px;
    padding: 1.4px;
    background: linear-gradient(
        135deg,
        rgba(140, 200, 255, 0.9),
        rgba(180, 180, 255, 0.3)
    );
    -webkit-mask:
        linear-gradient(#000 0 0) content-box,
        linear-gradient(#000 0 0);
    -webkit-mask-composite: xor;
    mask-composite: exclude;
}

/* hover */
.container-box:hover {
    transform: translateY(-10px) scale(1.05);
    box-shadow:
        0 0 30px rgba(120, 190, 255, 0.4),
        inset 0 0 25px rgba(255, 255, 255, 0.08);
}

/* ================= FOOTER ================= */
.footer {
    position: absolute;
    bottom: 0;
    width: 100%;
    padding: 14px;
    text-align: center;
    z-index: 10;
    font-size: 13px;
    color: #cfe8ff;
    text-shadow: 0 0 8px rgba(120, 190, 255, 0.3);
}

/* ================= RESPONSIVE ================= */
@media (max-width: 768px) {
    .options-container {
        flex-direction: column;
        gap: 25px;
    }
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
    <a href="index.jsp">Home</a>
    <a href="admin.jsp">Admin</a>
    <a href="owner_dashboard.jsp">Owner</a>
    <a href="user_dashboard.jsp">User</a>
</div>

<!-- ===== MAIN CONTENT ===== -->
<div class="page-content">
    <div class="options-container">

        <div class="container-box"
             onclick="location.href='user_register.jsp'">
            User Register
        </div>

        <div class="container-box"
             onclick="location.href='user_login.jsp'">
            User Login
        </div>

    </div>
</div>

<!-- ===== FOOTER ===== -->
<div class="footer glass">
    © 2025 Cloud Security Framework | Smart Authentication & Adaptive Encryption
</div>

</body>
</html>
