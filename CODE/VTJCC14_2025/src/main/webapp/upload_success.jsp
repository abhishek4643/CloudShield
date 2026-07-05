<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Upload Successful | Cloud Security Portal</title>

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
    padding: 18px 40px;
    text-align: center;
    z-index: 10;
}

.header-bar h1 {
    font-size: 26px;
    color: #e8f4ff;
    text-shadow: 0 0 15px rgba(120, 190, 255, 0.5);
}

/* ================= TOP NAV ================= */
.top-nav {
    position: absolute;
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

/* ================= MAIN CONTENT ================= */
.main-content {
    position: absolute;
    top: 160px;
    bottom: 80px;
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
}

/* ================= SUCCESS CARD ================= */
.success-container {
    width: 420px;
    padding: 45px;
    border-radius: 26px;
    text-align: center;
    animation: popGlow 1.2s ease forwards;
}

@keyframes popGlow {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
        box-shadow: 0 0 45px rgba(120, 190, 255, 0.4);
    }
}

.success-container h2 {
    font-size: 28px;
    color: #9fffb0;
    margin-bottom: 15px;
}

.success-container p {
    font-size: 16px;
    color: #d6ecff;
    line-height: 1.6;
    margin-bottom: 25px;
}

/* ================= BUTTON ================= */
.success-container a {
    display: inline-block;
    padding: 14px 28px;
    border-radius: 16px;
    background: linear-gradient(135deg, #4aa3ff, #2b6fff);
    color: #fff;
    font-size: 16px;
    font-weight: 700;
    text-decoration: none;
    transition: 0.3s;
}

.success-container a:hover {
    transform: translateY(-3px);
    box-shadow: 0 0 20px rgba(120, 190, 255, 0.8);
}

/* ================= FOOTER ================= */
.footer {
    position: absolute;
    bottom: 0;
    width: 100%;
    padding: 18px;
    text-align: center;
    color: #cfe8ff;
    font-size: 13px;
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
    <a href="index.jsp">Home</a>
    <a href="upload.jsp">Upload</a>
    <a href="owner_requests.jsp">Requests</a>
</div>

<!-- MAIN CONTENT -->
<div class="main-content">
    <div class="success-container glass">

        <h2>✔ Upload Successful</h2>
        <p>
            Your file has been securely encrypted and stored
            across cloud and blockchain layers.
        </p>

        <a href="upload.jsp">Upload Another File</a>
    </div>
</div>

<!-- FOOTER -->
<div class="footer glass">
    © 2025 Cloud Security Framework | Smart Authentication & Adaptive Encryption
</div>

</body>
</html>
