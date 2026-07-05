package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/AdminWarningServlet")
public class AdminWarningServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		ArrayList<String[]> warnings = new ArrayList<>();

		try {

			Connection con = Database.getConnection();

			PreparedStatement ps = con.prepareStatement("SELECT * FROM login_warnings ORDER BY attempt_time DESC");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				String[] row = new String[4];

				row[0] = rs.getString("user_email");
				row[1] = rs.getString("ip_address");
				row[2] = rs.getString("attempt_time");
				row[3] = rs.getString("status");

				warnings.add(row);
			}

			req.setAttribute("warnings", warnings);

			req.getRequestDispatcher("admin_warning.jsp").forward(req, resp);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
