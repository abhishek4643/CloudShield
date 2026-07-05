<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false"%>

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
<meta charset="UTF-8">
<title>Owner Upload | Cloud Security Portal</title>

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

/* ================= MAIN CONTENT ================= */
.page-content {
    position: absolute;
    top: 170px;
    bottom: 80px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
}

/* ================= UPLOAD CARD ================= */
.upload-container {
    width: 420px;
    padding: 35px;
    border-radius: 26px;
    text-align: center;
    animation: slideGlow 1.2s ease forwards;
}

@keyframes slideGlow {
    from {
        opacity: 0;
        transform: translateY(60px) scale(0.95);
    }
    to {
        opacity: 1;
        transform: translateY(0) scale(1);
        box-shadow: 0 0 40px rgba(120, 190, 255, 0.35);
    }
}

.upload-container h2 {
    font-size: 26px;
    color: #e8f4ff;
    margin-bottom: 25px;
}

/* ================= INPUT ================= */
.field {
    margin-bottom: 18px;
}

.field input[type="text"],
.field input[type="file"] {
    width: 100%;
    padding: 12px;
    border-radius: 12px;
    border: 1px solid rgba(255,255,255,0.35);
    background: rgba(255,255,255,0.15);
    color: #fff;
    outline: none;
}

/* ================= BUTTON ================= */
button {
    width: 100%;
    padding: 14px;
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

/* ================= MESSAGE ================= */
.msg {
    margin-top: 15px;
    font-size: 14px;
    color: #9fffb0;
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

<!-- HEADER -->
<div class="header-bar glass">
    <h1>Securing Cloud Systems with Smart Authentication and Adaptive Encryption</h1>
</div>

<!-- TOP NAV -->
<div class="top-nav glass">
    <a href="owner_login_dashboard.jsp">Home</a>
    <a href="upload.jsp">Upload</a>
    <a href="owner_requests.jsp">Requests</a>
</div>

<!-- SESSION BUBBLE -->
<div class="session-bubble">
    👤 <span>Owner : <%= ownerEmail %></span>
</div>

<!-- MAIN CONTENT -->
<div class="page-content">
    <div class="upload-container glass">

        <h2>Secure File Upload</h2>

        <form action="OwnerUploadServlet" method="post" enctype="multipart/form-data">

            <div class="field">
                <input type="text" name="custom_filename"
                       placeholder="Custom File Name" required>
            </div>

            <div class="field">
                <input type="file" name="file" required>
            </div>

            <button type="submit">Upload & Encrypt</button>
        </form>

        <div class="msg">${msg}</div>
    </div>
</div>

<!-- FOOTER -->
<div class="footer glass">
    © 2025 Cloud Security Framework | Smart Authentication & Adaptive Encryption
</div>

</body>
</html>
