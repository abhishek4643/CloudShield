package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/UserSearchServlet")
public class UserSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String customFilename = req.getParameter("custom_filename");

		try {
			Connection con = Database.getConnection();

			PreparedStatement ps = con
					.prepareStatement("SELECT fid, custom_filename, sha256_hash, public_key, aes_data "
							+ "FROM upload_data WHERE custom_filename=?");
			ps.setString(1, customFilename);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				req.setAttribute("fid", rs.getInt("fid"));
				req.setAttribute("custom_filename", rs.getString("custom_filename"));
				req.setAttribute("sha256", rs.getString("sha256_hash"));
				req.setAttribute("public_key", rs.getString("public_key"));
				req.setAttribute("encrypted_data", rs.getBytes("aes_data"));

				req.getRequestDispatcher("user_search_result.jsp").forward(req, resp);
			} else {
				req.setAttribute("error", "No data found");
				req.getRequestDispatcher("user_search.jsp").forward(req, resp);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
