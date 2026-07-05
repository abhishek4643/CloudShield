//package com.user;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.DB.Database;
//import com.utility.PasswordUtil;
//
//@WebServlet("/UserLoginServlet")
//public class UserLoginServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
//
//		String email = req.getParameter("email");
//		String password = req.getParameter("password");
//		String otp = req.getParameter("otp");
//
//		String hashedPassword = PasswordUtil.hashPassword(password);
//
//		try {
//			Connection con = Database.getConnection();
//
//			PreparedStatement ps = con.prepareStatement(
//					"SELECT * FROM users WHERE email=? AND password_hash=? AND otp=? AND status='APPROVED'");
//
//			ps.setString(1, email);
//			ps.setString(2, hashedPassword);
//			ps.setString(3, otp);
//
//			ResultSet rs = ps.executeQuery();
//
//			if (rs.next()) {
//				req.getSession().setAttribute("userEmail", email);
//				resp.sendRedirect("user_login_dashboard.jsp");
//			} else {
//				req.setAttribute("error", "Invalid credentials or approval pending");
//				req.getRequestDispatcher("user_login.jsp").forward(req, resp);
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//}

package com.user;

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
//import com.utility.EmailUtil; // optional
import com.utility.LoginWarningUtil;
import com.utility.PasswordUtil;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private static final int MAX_ATTEMPTS = 3;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		HttpSession session = req.getSession();

		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String otp = req.getParameter("otp");

		String hashedPassword = PasswordUtil.hashPassword(password);

		Integer attempts = (Integer) session.getAttribute("attempts");

		if (attempts == null) {
			attempts = 0;
		}

		try {

			Connection con = Database.getConnection();

			PreparedStatement ps = con.prepareStatement(
					"SELECT * FROM users WHERE email=? AND password_hash=? AND otp=? AND status='APPROVED'");

			ps.setString(1, email);
			ps.setString(2, hashedPassword);
			ps.setString(3, otp);

			ResultSet rs = ps.executeQuery();

			// ✅ SUCCESS LOGIN
			if (rs.next()) {

				session.setAttribute("userEmail", email);

				// reset attempts
				session.setAttribute("attempts", 0);

				resp.sendRedirect("user_login_dashboard.jsp");
			}

			// ❌ FAILED LOGIN
			else {

				attempts++;
				session.setAttribute("attempts", attempts);

				if (attempts >= MAX_ATTEMPTS) {

					String ip = req.getRemoteAddr();

					// Store warning
					LoginWarningUtil.storeWarning(email, ip);

					// OPTIONAL EMAIL ALERT
//					EmailUtil.sendWarningEmail(email);

					req.setAttribute("error", "Too many failed attempts! Admin notified.");

				} else {

					req.setAttribute("error", "Invalid credentials! Attempt " + attempts + "/" + MAX_ATTEMPTS);
				}

				req.getRequestDispatcher("user_login.jsp").forward(req, resp);
			}

		} catch (Exception e) {

			e.printStackTrace();

			req.setAttribute("error", "Server error!");
			req.getRequestDispatcher("user_login.jsp").forward(req, resp);
		}
	}
}
