package Controller.PassEncryption;

import java.nio.charset.StandardCharsets;
import java.security.Key;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class EncDyc {
	public static final String algo="AES";
	public static String encryption(String strToEncrypt, String secretKey)throws Exception{
		Key key=generateKey(secretKey);
		Cipher cipher=Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.ENCRYPT_MODE,key);
		byte[] encryptedBytes=cipher.doFinal(strToEncrypt.getBytes(StandardCharsets.UTF_8));
		return new String(encryptedBytes, StandardCharsets.ISO_8859_1);
	}
	
	public static String decrypt(String strToDecrypt, String secretKey)throws Exception{
		Key key=generateKey(secretKey);
		Cipher cipher=Cipher.getInstance("AES/ECB/PKCS5Padding");
		cipher.init(Cipher.DECRYPT_MODE,key);
		byte[] encryptedBytes=cipher.doFinal(strToDecrypt.getBytes(StandardCharsets.UTF_8));
		return new String(encryptedBytes, StandardCharsets.ISO_8859_1);
	}
	private static Key generateKey(String secretKey) {
		// TODO Auto-generated method stub
		byte [] KeyBytes=secretKey.getBytes(StandardCharsets.UTF_8);
		return new SecretKeySpec(KeyBytes, algo);
	}
}
