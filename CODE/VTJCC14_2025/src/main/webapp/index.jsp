<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cloud Computing Portal</title>

<style>
/* ===== RESET ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

/* ===== BODY ===== */
body {
    min-height: 100vh;
    background: url('<%= request.getContextPath() %>/images/vtjcc14.jpg')
        no-repeat center / cover;
    display: flex;
    flex-direction: column;
    position: relative;
}

/* ===== DARK OVERLAY ===== */
body::before {
    content: "";
    position: absolute;
    inset: 0;
    background: rgba(0,0,0,0.6);
    z-index: 0;
}

/* ===== HEADER ===== */
.header {
    z-index: 1;
    text-align: center;
    padding: 30px;
    color: #fff;
    animation: fadeDown 1s ease;
}

@keyframes fadeDown {
    from { opacity: 0; transform: translateY(-40px); }
    to   { opacity: 1; transform: translateY(0); }
}

/* ===== MAIN ===== */
.main-wrapper {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 1;
}

/* ===== CONTAINER ===== */
.main-container {
    display: flex;
    gap: 30px;
}

/* ===== CARD ===== */
.container-box {
    width: 220px;
    height: 130px;
    background: rgba(255,255,255,0.12);
    border-radius: 16px;
    border: 1px solid rgba(255,255,255,0.3);
    display: flex;
    align-items: center;
    justify-content: center;
    color: #fff;
    font-size: 22px;
    font-weight: bold;
    cursor: pointer;

    animation: bounceIn 0.9s ease forwards;
    transition: transform 0.2s ease, box-shadow 0.2s ease;
}

/* Delay animations */
.container-box:nth-child(1) { animation-delay: 0.2s; }
.container-box:nth-child(2) { animation-delay: 0.4s; }
.container-box:nth-child(3) { animation-delay: 0.6s; }

@keyframes bounceIn {
    0%   { opacity: 0; transform: scale(0.6); }
    60%  { opacity: 1; transform: scale(1.1); }
    100% { transform: scale(1); }
}

/* ===== HOVER ===== */
.container-box:hover {
    transform: translateY(-6px);
    box-shadow: 0 0 25px rgba(120,190,255,0.8);
}

/* ===== CLICK ===== */
.container-box:active {
    transform: scale(0.95);
}

/* ===== FOOTER ===== */
.footer {
    z-index: 1;
    text-align: center;
    padding: 15px;
    color: #e0e0e0;
    font-size: 14px;
    animation: fadeUp 1s ease;
}

@keyframes fadeUp {
    from { opacity: 0; transform: translateY(30px); }
    to   { opacity: 1; transform: translateY(0); }
}

/* ===== RESPONSIVE ===== */
@media (max-width: 800px) {
    .main-container {
        flex-direction: column;
    }
}
</style>
</head>

<body>

<!-- HEADER -->
<div class="header">
    <h1>Securing Cloud Systems with Smart Authentication and Adaptive Encryption</h1>
</div>

<!-- MAIN -->
<div class="main-wrapper">
    <div class="main-container">

        <div class="container-box" onclick="location.href='admin.jsp'">
            Admin
        </div>

        <div class="container-box" onclick="location.href='owner_dashboard.jsp'">
            Owner
        </div>

        <div class="container-box" onclick="location.href='user_dashboard.jsp'">
            User
        </div>

    </div>
</div>

<!-- FOOTER -->
<div class="footer">
    © 2025 Cloud Security Framework
</div>

</body>
</html>
 --%>
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cloud Computing Portal</title>

<style>

/* ================= RESET ================= */
*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:"Segoe UI",sans-serif;
}

/* ================= BODY ================= */
body{
min-height:100vh;
background:url('<%= request.getContextPath() %>/images/vtjcc14.jpg')
no-repeat center center/cover;
position:relative;
display:flex;
flex-direction:column;
}

/* ================= DARK OVERLAY ================= */
body::before{
content:"";
position:fixed;
inset:0;
background:rgba(0,0,0,0.6);
z-index:0;
}

/* ================= GLASS ================= */
.glass{
background:rgba(255,255,255,0.1);
backdrop-filter:blur(18px);
border:1px solid rgba(255,255,255,0.2);
box-shadow:
inset 0 0 20px rgba(255,255,255,0.05),
0 0 30px rgba(120,190,255,0.2);
}

/* ================= HEADER ================= */
.header{
z-index:1;
text-align:center;
padding:40px 20px 20px;
animation:fadeDown 1s ease;
}

.header h1{
color:#e8f4ff;
font-size:30px;
text-shadow:0 0 20px rgba(120,190,255,0.6);
}

.header p{
margin-top:10px;
color:#cfe8ff;
font-size:15px;
}

@keyframes fadeDown{
from{opacity:0;transform:translateY(-40px);}
to{opacity:1;transform:translateY(0);}
}

/* ================= MAIN ================= */
.main-wrapper{
flex:1;
display:flex;
justify-content:center;
align-items:center;
z-index:1;
}

/* ================= CARD CONTAINER ================= */
.main-container{
display:flex;
gap:40px;
}

/* ================= CARD ================= */
.portal-card{
width:240px;
height:160px;
border-radius:22px;
cursor:pointer;
display:flex;
flex-direction:column;
justify-content:center;
align-items:center;
color:#fff;
text-align:center;
transition:0.3s;
animation:scaleIn 0.8s ease forwards;
}

.portal-card:nth-child(1){animation-delay:0.2s;}
.portal-card:nth-child(2){animation-delay:0.4s;}
.portal-card:nth-child(3){animation-delay:0.6s;}

@keyframes scaleIn{
0%{opacity:0;transform:scale(0.6);}
60%{opacity:1;transform:scale(1.08);}
100%{transform:scale(1);}
}

/* ================= ICON ================= */
.portal-card .icon{
font-size:36px;
margin-bottom:10px;
}

/* ================= TEXT ================= */
.portal-card h2{
font-size:22px;
margin-bottom:5px;
}

.portal-card span{
font-size:13px;
color:#cfe8ff;
}

/* ================= HOVER ================= */
.portal-card:hover{
transform:translateY(-8px);
box-shadow:0 0 30px rgba(120,190,255,0.9);
}

/* ================= FOOTER ================= */
.footer{
z-index:1;
text-align:center;
padding:15px;
color:#cfe8ff;
font-size:14px;
animation:fadeUp 1s ease;
}

@keyframes fadeUp{
from{opacity:0;transform:translateY(30px);}
to{opacity:1;transform:translateY(0);}
}

/* ================= RESPONSIVE ================= */
@media(max-width:850px){
.main-container{
flex-direction:column;
gap:25px;
}
}

</style>
</head>

<body>

<!-- ================= HEADER ================= -->
<div class="header">
<h1>Securing Cloud Systems</h1>
<p>Smart Authentication • Adaptive Encryption • Threat Monitoring</p>
</div>

<!-- ================= MAIN ================= -->
<div class="main-wrapper">
<div class="main-container">

<div class="portal-card glass" onclick="location.href='admin.jsp'">
<div class="icon">🛡️</div>
<h2>Admin</h2>
<span>System Control & Monitoring</span>
</div>

<div class="portal-card glass" onclick="location.href='owner_dashboard.jsp'">
<div class="icon">☁️</div>
<h2>Owner</h2>
<span>Data Upload & Management</span>
</div>

<div class="portal-card glass" onclick="location.href='user_dashboard.jsp'">
<div class="icon">👤</div>
<h2>User</h2>
<span>Secure Data Access</span>
</div>

</div>
</div>

<!-- ================= FOOTER ================= -->
<div class="footer">
© 2025 Cloud Security Framework | Smart Cloud Protection
</div>

</body>
</html>
 