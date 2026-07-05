<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration | Cloud Security Portal</title>

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
    min-height: 200vh;
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
    letter-spacing: 0.6px;
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

/* ================= REGISTRATION SECTION ================= */
.register-section {
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
}

/* ================= FORM CARD ================= */
.register-container {
    width: 460px;
    padding: 45px;
    border-radius: 26px;
    text-align: center;
}

.register-container h2 {
    font-size: 28px;
    color: #e8f4ff;
    margin-bottom: 30px;
}

/* ================= INPUT FIELDS ================= */
.field {
    position: relative;
    margin-bottom: 24px;
}

.field input,
.field textarea {
    width: 100%;
    padding: 14px;
    border-radius: 14px;
    border: 1px solid rgba(255,255,255,0.35);
    background: rgba(255,255,255,0.15);
    color: #fff;
    outline: none;
    resize: none;
}

.field textarea {
    height: 80px;
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
.field textarea:focus + label,
.field input:not(:placeholder-shown) + label,
.field textarea:not(:placeholder-shown) + label {
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

/* ================= LOGIN LINK ================= */
.login-link {
    margin-top: 18px;
    font-size: 14px;
    color: #d6ecff;
}

.login-link a {
    color: #9fd3ff;
    text-decoration: none;
    font-weight: 600;
}

.login-link a:hover {
    text-shadow: 0 0 10px rgba(120, 190, 255, 0.9);
    text-decoration: underline;
}

/* ================= MESSAGE ================= */
.msg {
    margin-top: 15px;
    color: #9fffb0;
    font-size: 14px;
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

<!-- ===== HEADER ===== -->
<div class="header-bar glass">
    <h1>Securing Cloud Systems with Smart Authentication and Adaptive Encryption</h1>
</div>

<!-- ===== TOP NAV ===== -->
<div class="top-nav glass">
    <a href="index.jsp">Home</a>
    <a href="admin_login.jsp">Admin</a>
    <a href="owner_dashboard.jsp">Owner</a>
    <a href="user_dashboard.jsp">User</a>
</div>

<!-- ===== HERO SECTION ===== -->
<section class="hero">
    <div class="hero-content">
        <h2>User Registration</h2>
        <p>
            New users can securely register to access cloud services.
            The system ensures secure identity creation using encrypted
            credentials and controlled access mechanisms.
        </p>
        <div class="scroll-hint">⬇ Scroll down to Register ⬇</div>
    </div>
</section>

<!-- ===== REGISTRATION FORM ===== -->
<section class="register-section">
    <div class="register-container glass">

        <h2>Create User Account</h2>

        <form action="UserRegisterServlet" method="post">

            <div class="field">
                <input type="text" name="name" required placeholder=" ">
                <label>Full Name</label>
            </div>

            <div class="field">
                <input type="email" name="email" required placeholder=" ">
                <label>Email</label>
            </div>

            <div class="field">
                <input type="password" name="password" required placeholder=" " 
                pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{6,}$">
                <label>Password</label>
            </div>

            <div class="field">
                <input type="text" name="mobile" required placeholder=" " pattern="[0-9]{10}" >
                <label>Mobile Number</label>
            </div>

            <div class="field">
                <textarea name="address" required placeholder=" "></textarea>
                <label>Address</label>
            </div>

            <button type="submit">Register</button>

            <div class="login-link">
                Already registered?
                <a href="user_login.jsp">Click here to login</a>
            </div>

        </form>

        <div class="msg">${msg}</div>

    </div>
</section>

<!-- ===== FOOTER ===== -->
<div class="footer glass">
    © 2025 Cloud Security Framework | Smart Authentication & Adaptive Encryption
</div>

</body>
</html>
