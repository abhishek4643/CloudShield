package com.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/RequestAccessServlet")
public class RequestAccessServlet extends HttpServlet {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

//    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int fid = Integer.parseInt(req.getParameter("fid"));
        String customFilename = req.getParameter("custom_filename");

        String userEmail = (String) req.getSession().getAttribute("userEmail");

        try {
            Connection con = Database.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO access_requests (fid, user_email, custom_filename) VALUES (?,?,?)"
            );

            ps.setInt(1, fid);
            ps.setString(2, userEmail);
            ps.setString(3, customFilename);
            ps.executeUpdate();

            // ✅ success message
            req.setAttribute("message", "Access request sent successfully to Owner. Please wait for approval.");
            req.getRequestDispatcher("request_sent.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("message", "Failed to send access request. Try again.");
            req.getRequestDispatcher("request_sent.jsp").forward(req, resp);
        }
    }
}
