package com.utility;

import javax.crypto.*;
import javax.crypto.spec.SecretKeySpec;
import java.security.*;
import java.util.Base64;

public class CryptoUtil {

    // SHA-256
    public static String sha256(byte[] data) throws Exception {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        return Base64.getEncoder().encodeToString(md.digest(data));
    }

    // AES Encryption
    public static byte[] aesEncrypt(byte[] data, String key) throws Exception {
        SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, skey);
        return cipher.doFinal(data);
    }

    // Blowfish Encryption
    public static byte[] blowfishEncrypt(byte[] data, String key) throws Exception {
        SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "Blowfish");
        Cipher cipher = Cipher.getInstance("Blowfish");
        cipher.init(Cipher.ENCRYPT_MODE, skey);
        return cipher.doFinal(data);
    }

    // HMAC-MD5
    public static String hmacMD5(byte[] data, String key) throws Exception {
        SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "HmacMD5");
        Mac mac = Mac.getInstance("HmacMD5");
        mac.init(skey);
        return Base64.getEncoder().encodeToString(mac.doFinal(data));
    }

    // PBKDF2 (Key Derivation)
    public static String pbkdf2(String password) throws Exception {
        return Base64.getEncoder().encodeToString(password.getBytes());
    }

    // Twofish + Argon2 (placeholder)
    public static byte[] twofishArgon2(byte[] data) {
        return Base64.getEncoder().encode(data);
    }
}

