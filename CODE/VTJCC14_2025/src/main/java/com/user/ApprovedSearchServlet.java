package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/ApprovedSearchServlet")
public class ApprovedSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String customFilename = req.getParameter("custom_filename");
		String userEmail = (String) req.getSession().getAttribute("userEmail");

		try {
			Connection con = Database.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT u.file_name, d.sha256_hash, a.private_key, u.aes_data "
					+ "FROM access_requests a " + "JOIN data_upload d ON a.fid=d.fid "
					+ "JOIN upload_data u ON u.fid=d.fid " + "WHERE a.custom_filename=? AND a.user_email=? "
					+ "AND a.request_status='ADMIN_APPROVED'");

			ps.setString(1, customFilename);
			ps.setString(2, userEmail);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				req.setAttribute("file_name", rs.getString("file_name"));
				req.setAttribute("sha256", rs.getString("sha256_hash"));
				req.setAttribute("private_key", rs.getString("private_key"));
				req.setAttribute("encrypted_data", rs.getBytes("aes_data"));
			} else {
				req.setAttribute("error", "Key not shared yet");
			}

			req.getRequestDispatcher("approvedsearch.jsp").forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
