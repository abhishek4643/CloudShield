<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Owner Login | Cloud Security Portal</title>

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
    background: url('<%= request.getContextPath() %>/images/vtjcc14.jpg')
                no-repeat center center / cover;
    position: relative;
}

/* ================= DARK OVERLAY ================= */
body::before {
    content: "";
    position: fixed;
    inset: 0;
    background: rgba(0, 0, 0, 0.6);
    z-index: 0;
}

/* ================= GLASS BASE ================= */
.glass {
    background: rgba(255, 255, 255, 0.08);
    backdrop-filter: blur(22px);
    -webkit-backdrop-filter: blur(22px);
    border: 1px solid rgba(255, 255, 255, 0.18);
    box-shadow:
        inset 0 0 20px rgba(255, 255, 255, 0.05),
        0 0 30px rgba(120, 190, 255, 0.2);
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
    text-shadow: 0 0 14px rgba(120, 190, 255, 0.6);
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
    text-shadow: 0 0 10px rgba(120, 190, 255, 0.9);
}

/* ================= MAIN ================= */
.main-content {
    position: absolute;
    top: 160px;
    bottom: 110px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
}

/* ================= LOGIN CARD ================= */
.login-container {
    width: 380px;
    padding: 30px;
    border-radius: 22px;
    text-align: center;
    animation: slideGlow 1.2s ease forwards;
}

@keyframes slideGlow {
    0% {
        opacity: 0;
        transform: translateY(60px) scale(0.95);
    }
    100% {
        opacity: 1;
        transform: translateY(0) scale(1);
        box-shadow: 0 0 40px rgba(120, 190, 255, 0.35);
    }
}

.login-container h2 {
    font-size: 26px;
    color: #e8f4ff;
    margin-bottom: 24px;
}

/* ================= INPUT ================= */
.field {
    position: relative;
    margin-bottom: 18px;
}

.field input {
    width: 100%;
    padding: 12px;
    border-radius: 12px;
    border: 1px solid rgba(255,255,255,0.35);
    background: rgba(255,255,255,0.15);
    color: #fff;
    outline: none;
}

.field label {
    position: absolute;
    top: 50%;
    left: 12px;
    transform: translateY(-50%);
    color: #dbe9ff;
    transition: 0.3s;
}

.field input:focus + label,
.field input:not(:placeholder-shown) + label {
    top: -8px;
    background: rgba(0,0,0,0.7);
    padding: 2px 6px;
    font-size: 12px;
    border-radius: 6px;
}

/* ================= BUTTON ================= */
button {
    width: 100%;
    padding: 13px;
    border-radius: 14px;
    border: none;
    background: linear-gradient(135deg, #4aa3ff, #2b6fff);
    color: #fff;
    font-size: 17px;
    font-weight: 700;
    cursor: pointer;
    transition: 0.3s;
}

button:hover {
    transform: translateY(-3px);
    box-shadow: 0 0 20px rgba(120, 190, 255, 0.8);
}

/* ================= REGISTER LINK ================= */
.register-link {
    margin-top: 18px;
    font-size: 14px;
    color: #d6ecff;
}

.register-link a {
    color: #9fd3ff;
    font-weight: 600;
    text-decoration: none;
}

.register-link a:hover {
    text-decoration: underline;
    text-shadow: 0 0 10px rgba(120, 190, 255, 0.9);
}

/* ================= ERROR ================= */
.error {
    margin-top: 14px;
    color: #ff9f9f;
    font-size: 14px;
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
    <h1>Securing Cloud Systems with Smart Authentication and Adaptive Encryption</h1>
</div>

<!-- ===== TOP NAV ===== -->
<div class="top-nav glass">
    <a href="index.jsp">Home</a>
    <a href="admin.jsp">Admin</a>
    <a href="owner_dashboard.jsp">Owner</a>
    <a href="user_dashboard.jsp">User</a>
</div>

<!-- ===== MAIN ===== -->
<div class="main-content">
    <div class="login-container glass">

        <h2>Owner Login</h2>

        <form action="OwnerLoginServlet" method="post">

            <div class="field">
                <input type="email" name="email" required placeholder=" ">
                <label>Email</label>
            </div>

            <div class="field">
                <input type="password" name="password" required placeholder=" ">
                <label>Password</label>
            </div>

            <div class="field">
                <input type="text" name="otp" required placeholder=" ">
                <label>OTP</label>
            </div>

            <button type="submit">Login</button>

        </form>

        <div class="register-link">
            Not registered yet?
            <a href="owner_register.jsp">Register now</a>
        </div>

        <div class="error">${error}</div>

    </div>
</div>

<!-- ===== FOOTER ===== -->
<div class="footer glass">
    © 2025 Cloud Security Framework | Smart Authentication & Adaptive Encryption
</div>

</body>
</html>
