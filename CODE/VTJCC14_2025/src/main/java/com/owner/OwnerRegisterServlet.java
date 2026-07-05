package com.owner;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DB.Database;
import com.utility.PasswordUtil;

@WebServlet("/OwnerRegisterServlet")
public class OwnerRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        
        if (!email.matches("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$")) {
        	req.setAttribute("error", "Invalid email format!");
        	req.getRequestDispatcher("owner_register.jsp").forward(req, resp);
			return;
		}

		// PASSWORD VALIDATION
		String passwordRegex = "^(?=.*[A-Z])(?=.*[a-z]+)(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{6,}$";
		if (!password.matches(passwordRegex)) {
			req.setAttribute("error",
					"Password must contain 1 uppercase letter, lowercase letters, numbers and a special character!");
			req.getRequestDispatcher("owner_register.jsp").forward(req, resp);
			return;
		}

		// MOBILE NUMBER VALIDATION
		if (!mobile.matches("\\d{10}$")) {
			req.setAttribute("error", "Phone number must start with 89 and contain exactly 10 digits!");
			req.getRequestDispatcher("owner_register.jsp").forward(req, resp);
			return;
		}
        String hashedPassword = PasswordUtil.hashPassword(password);
        String otp = String.valueOf(100000 + new java.util.Random().nextInt(900000));

        System.out.println("Generated OTP for " + email + " : " + otp);

        try { Connection con = Database.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO owner_details(name,email,password_hash,mobile,address,otp) VALUES (?,?,?,?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, hashedPassword);
            ps.setString(4, mobile);
            ps.setString(5, address);
            ps.setString(6, otp);

            ps.executeUpdate();

            req.setAttribute("msg", "Registration successful! OTP generated.");
            req.getRequestDispatcher("owner_login.jsp").forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
