package com.owner;

import java.io.IOException;
import java.io.InputStream;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.sql.*;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.DB.Database;
import com.utility.CryptoUtil;

@WebServlet("/OwnerUploadServlet")
@MultipartConfig
public class OwnerUploadServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String customFilename = req.getParameter("custom_filename");
        Part filePart = req.getPart("file");

        String originalFilename = filePart.getSubmittedFileName();
        byte[] fileBytes;

        Connection con = null;

        try (InputStream is = filePart.getInputStream()) {

            // ✅ Read original file
            fileBytes = is.readAllBytes();

            con = Database.getConnection();
            con.setAutoCommit(false);

            /* ================= SECURITY ================= */

            String sha256 = CryptoUtil.sha256(fileBytes);
            byte[] aesData = CryptoUtil.aesEncrypt(fileBytes, "1234567890123456");
            String hmacMd5 = CryptoUtil.hmacMD5(fileBytes, "hmacKey");
            String pbkdf2 = CryptoUtil.pbkdf2("passwordKey");
            byte[] twofish = CryptoUtil.twofishArgon2(fileBytes);
            byte[] blowfish = CryptoUtil.blowfishEncrypt(fileBytes, "blowfishKey");

            KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA");
            kpg.initialize(2048);
            KeyPair kp = kpg.generateKeyPair();

            String publicKey = Base64.getEncoder().encodeToString(kp.getPublic().getEncoded());
            String privateKey = Base64.getEncoder().encodeToString(kp.getPrivate().getEncoded());

            /* ================= upload_data ================= */

            PreparedStatement ps1 = con.prepareStatement(
                "INSERT INTO upload_data " +
                "(custom_filename, file_name, original_data, sha256_hash, aes_data, hmac_md5, " +
                "pbkdf2_key, twofish_argon2, blowfish_data, public_key, private_key) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?)",
                Statement.RETURN_GENERATED_KEYS
            );

            ps1.setString(1, customFilename);
            ps1.setString(2, originalFilename);
            ps1.setBytes(3, fileBytes);      // ✅ ORIGINAL FILE
            ps1.setString(4, sha256);
            ps1.setBytes(5, aesData);
            ps1.setString(6, hmacMd5);
            ps1.setString(7, pbkdf2);
            ps1.setBytes(8, twofish);
            ps1.setBytes(9, blowfish);
            ps1.setString(10, publicKey);
            ps1.setString(11, privateKey);

            ps1.executeUpdate();

            ResultSet rs = ps1.getGeneratedKeys();
            rs.next();
            int fid = rs.getInt(1);

            /* ================= data_upload ================= */

            PreparedStatement ps2 = con.prepareStatement(
                "INSERT INTO data_upload (fid, custom_filename, sha256_hash, public_key, private_key) " +
                "VALUES (?,?,?,?,?)"
            );

            ps2.setInt(1, fid);
            ps2.setString(2, customFilename);
            ps2.setString(3, sha256);
            ps2.setString(4, publicKey);
            ps2.setString(5, privateKey);

            ps2.executeUpdate();

            con.commit();

            req.setAttribute("msg", "File uploaded and secured successfully");
            req.getRequestDispatcher("upload_success.jsp").forward(req, resp);

        } catch (Exception e) {
            try {
                if (con != null) con.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            resp.sendRedirect("upload_error.jsp");
        } finally {
            try {
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}

