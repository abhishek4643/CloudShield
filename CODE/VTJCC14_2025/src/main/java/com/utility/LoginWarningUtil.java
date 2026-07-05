package com.utility;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.DB.Database;

public class LoginWarningUtil {

    public static void storeWarning(String email, String ip) {

        try {
            Connection con = Database.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO login_warnings(user_email, ip_address) VALUES (?, ?)");

            ps.setString(1, email);
            ps.setString(2, ip);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
