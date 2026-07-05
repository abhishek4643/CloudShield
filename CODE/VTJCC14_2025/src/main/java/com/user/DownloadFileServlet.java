package com.user;

import java.io.IOException;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/DownloadFileServlet")
public class DownloadFileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String customFilename = req.getParameter("custom_filename");

        try (Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT file_name, original_data FROM upload_data WHERE custom_filename=?")) {

            ps.setString(1, customFilename);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String fileName = rs.getString("file_name");
                byte[] fileData = rs.getBytes("original_data");

                resp.setContentType("application/octet-stream");
                resp.setHeader("Content-Disposition",
                        "attachment; filename=\"" + fileName + "\"");

                resp.getOutputStream().write(fileData);
                resp.getOutputStream().flush();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
