package com.owner;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;

@WebServlet("/OwnerApproveRequestServlet")
public class OwnerApproveRequestServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        int requestId = Integer.parseInt(req.getParameter("requestId"));

        try { Connection con = Database.getConnection();
             PreparedStatement ps = con.prepareStatement(
                "UPDATE access_requests SET request_status='OWNER_APPROVED' WHERE id=?") ;

            ps.setInt(1, requestId);
            ps.executeUpdate();

            resp.sendRedirect("owner_requests.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
