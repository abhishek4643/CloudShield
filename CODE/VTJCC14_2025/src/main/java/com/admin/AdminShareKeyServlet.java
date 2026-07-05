package com.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;

@WebServlet("/AdminShareKeyServlet")
public class AdminShareKeyServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int requestId = Integer.parseInt(req.getParameter("requestId"));

        try { Connection con = Database.getConnection();

            // Get private key from data_upload
            PreparedStatement ps1 = con.prepareStatement(
                "SELECT d.private_key FROM data_upload d " +
                "JOIN access_requests a ON d.fid=a.fid WHERE a.id=?"
            );
            ps1.setInt(1, requestId);

            ResultSet rs = ps1.executeQuery();

            if (rs.next()) {
                String privateKey = rs.getString("private_key");

                PreparedStatement ps2 = con.prepareStatement(
                    "UPDATE access_requests SET private_key=?, request_status='ADMIN_APPROVED' WHERE id=?"
                );
                ps2.setString(1, privateKey);
                ps2.setInt(2, requestId);
                ps2.executeUpdate();
            }

            resp.sendRedirect("admin_requests.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
