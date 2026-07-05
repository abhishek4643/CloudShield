package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;

@WebServlet("/ApproveUserServlet")
public class ApproveUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

		int userId = Integer.parseInt(req.getParameter("userId"));

		try {
			Connection con = Database.getConnection();

			PreparedStatement ps = con.prepareStatement("UPDATE users SET status='APPROVED' WHERE id=?");
			ps.setInt(1, userId);
			ps.executeUpdate();

			resp.sendRedirect("admin_user_approval.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
