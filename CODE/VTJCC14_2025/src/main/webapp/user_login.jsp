<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Login | Cloud Security Portal</title>

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
    min-height: 200vh; /* enables scrolling */
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
    letter-spacing: 1px;
    text-shadow: 0 0 15px rgba(120, 190, 255, 0.5);
}

/* ================= TOP NAV BAR ================= */
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
    transition: 0.3s;
}

.top-nav a:hover {
    color: #9fd3ff;
    text-shadow: 0 0 10px rgba(120, 190, 255, 0.8);
}

/* ================= HERO SECTION ================= */
.hero {
    height: 100vh;
    margin-top: 160px;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    z-index: 1;
    padding: 40px;
}

.hero-content {
    max-width: 900px;
}

.hero h2 {
    font-size: 36px;
    color: #e8f4ff;
    margin-bottom: 20px;
    text-shadow: 0 0 15px rgba(120, 190, 255, 0.5);
}

.hero p {
    font-size: 18px;
    line-height: 1.7;
    color: #d6ecff;
}

.scroll-hint {
    margin-top: 30px;
    font-size: 14px;
    color: #9fd3ff;
    animation: bounce 1.6s infinite;
}

@keyframes bounce {
    0%,100% { transform: translateY(0); }
    50% { transform: translateY(10px); }
}

/* ================= LOGIN SECTION ================= */
.login-section {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
}

/* ================= LOGIN CARD ================= */
.login-container {
    width: 460px;
    padding: 45px;
    border-radius: 26px;
    text-align: center;
}

.login-container h2 {
    font-size: 28px;
    color: #e8f4ff;
    margin-bottom: 30px;
}

/* ================= INPUT ================= */
.field {
    position: relative;
    margin-bottom: 24px;
}

.field input {
    width: 100%;
    padding: 14px;
    border-radius: 14px;
    border: 1px solid rgba(255,255,255,0.35);
    background: rgba(255,255,255,0.15);
    color: #fff;
    outline: none;
}

.field label {
    position: absolute;
    top: 50%;
    left: 14px;
    transform: translateY(-50%);
    color: #dbe9ff;
    transition: 0.3s;
}

.field input:focus + label,
.field input:not(:placeholder-shown) + label {
    top: -8px;
    background: rgba(0,0,0,0.7);
    padding: 2px 8px;
    font-size: 12px;
    border-radius: 6px;
}

/* ================= BUTTON ================= */
button {
    width: 100%;
    padding: 15px;
    border-radius: 16px;
    border: none;
    background: linear-gradient(135deg, #4aa3ff, #2b6fff);
    color: #fff;
    font-size: 18px;
    font-weight: 700;
    cursor: pointer;
}

button:hover {
    transform: translateY(-3px);
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
    margin-top: 15px;
    color: #ff9f9f;
}

/* ================= FOOTER ================= */
.footer {
    padding: 18px;
    text-align: center;
    color: #cfe8ff;
    font-size: 13px;
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="header-bar glass">
    <h1>Securing Cloud Systems with Smart Authentication and Adaptive Encryption</h1>
</div>

<!-- TOP NAV -->
<div class="top-nav glass">
    <a href="index.jsp">Home</a>
    <a href="admin_login.jsp">Admin</a>
    <a href="owner_dashboard.jsp">Owner</a>
    <a href="user_dashboard.jsp">User</a>
</div>

<!-- HERO -->
<section class="hero">
    <div class="hero-content">
        <h2>User Login</h2>
        <p>
            Registered users can securely access cloud services using
            multi-factor authentication. OTP-based verification ensures
            confidentiality, integrity, and controlled access.
        </p>
        <div class="scroll-hint">⬇ Scroll down to Login ⬇</div>
    </div>
</section>

<!-- LOGIN FORM -->
<section class="login-section">
    <div class="login-container glass">

        <h2>User Secure Login</h2>

        <form action="UserLoginServlet" method="post">

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
            <a href="user_register.jsp">Register now</a>
        </div>

        <div class="error">${error}</div>

    </div>
</section>

<!-- FOOTER -->
<div class="footer glass">
    © 2025 Cloud Security Framework | Smart Authentication & Adaptive Encryption
</div>

</body>
</html>
