package com.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // ✅ Hardcoded Admin Credentials
        if ("admin".equals(username) && "admin123".equals(password)) {

            // ✅ CREATE SESSION
            HttpSession session = request.getSession(true);
            session.setAttribute("username", username); // 🔴 MUST MATCH JSP
            session.setMaxInactiveInterval(30 * 60); // 30 minutes

            response.sendRedirect("admin_login_dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid Admin Credentials");
            request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
    }
}
