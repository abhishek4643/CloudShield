package com.owner;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.Database;
import com.utility.PasswordUtil;

@WebServlet("/OwnerLoginServlet")
public class OwnerLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String otp = req.getParameter("otp");

        // Hash entered password
        String hashedPassword = PasswordUtil.hashPassword(password);

        String sql = "SELECT * FROM owner_details WHERE email=? AND password_hash=? AND otp=?";

        try (Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, email);
            ps.setString(2, hashedPassword);
            ps.setString(3, otp);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    // ✅ CREATE SESSION (IMPORTANT)
                    HttpSession session = req.getSession(true);
                    session.setAttribute("ownerEmail", email);

                    // ⏳ OPTIONAL BUT RECOMMENDED (30 minutes)
                    session.setMaxInactiveInterval(30 * 60);

                    // Redirect to dashboard
                    resp.sendRedirect("owner_login_dashboard.jsp");

                } else {
                    req.setAttribute("error", "Invalid Email / Password / OTP");
                    req.getRequestDispatcher("owner_login.jsp").forward(req, resp);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Server error. Please try again.");
            req.getRequestDispatcher("owner_login.jsp").forward(req, resp);
        }
    }
}
