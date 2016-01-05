package com.app1.util;

import java.security.Key;
import java.security.SecureRandom;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.Cipher;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import sun.security.krb5.internal.crypto.Des;

public class EncryptionUtils {
	public static final String ALGORITHM_DES = "DES/CBC/PKCS5Padding";
	private static Log log = LogFactory.getLog(Des.class);
	private static final String key = "thisismykey";
	/**
	 * DES�㷨������
	 *
	 * @param data
	 *            �������ַ���
	 * @param key
	 *            ����˽Կ�����Ȳ��ܹ�С��8λ
	 * @return ���ܺ���ֽ����飬һ����Base64����ʹ��
	 * @throws CryptException
	 *             �쳣
	 */
	public static String encode( String data) throws Exception {
		return encode(key, data.getBytes());
	}

	/**
	 * DES�㷨������
	 *
	 * @param data
	 *            �������ַ���
	 * @param key
	 *            ����˽Կ�����Ȳ��ܹ�С��8λ
	 * @return ���ܺ���ֽ����飬һ����Base64����ʹ��
	 * @throws CryptException
	 *             �쳣
	 */
	public static String encode(String key, byte[] data) throws Exception {
		try {
			DESKeySpec dks = new DESKeySpec(key.getBytes());

			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			// key�ĳ��Ȳ��ܹ�С��8λ�ֽ�
			Key secretKey = keyFactory.generateSecret(dks);
			Cipher cipher = Cipher.getInstance(ALGORITHM_DES);
			IvParameterSpec iv = new IvParameterSpec("********".getBytes());
			AlgorithmParameterSpec paramSpec = iv;
			cipher.init(Cipher.ENCRYPT_MODE, secretKey, paramSpec);

			byte[] bytes = cipher.doFinal(data);
			return Base64.encodeBase64String(bytes);
		} catch (Exception e) {
			throw new Exception(e);
		}
	}

	/**
	 * DES�㷨������
	 *
	 * @param data
	 *            �������ַ���
	 * @param key
	 *            ����˽Կ�����Ȳ��ܹ�С��8λ
	 * @return ���ܺ���ֽ�����
	 * @throws Exception
	 *             �쳣
	 */
	public static byte[] decode(String key, byte[] data) throws Exception {
		try {
			SecureRandom sr = new SecureRandom();
			DESKeySpec dks = new DESKeySpec(key.getBytes());
			SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("DES");
			// key�ĳ��Ȳ��ܹ�С��8λ�ֽ�
			Key secretKey = keyFactory.generateSecret(dks);
			Cipher cipher = Cipher.getInstance(ALGORITHM_DES);
			IvParameterSpec iv = new IvParameterSpec("********".getBytes());
			AlgorithmParameterSpec paramSpec = iv;
			cipher.init(Cipher.DECRYPT_MODE, secretKey, paramSpec);
			return cipher.doFinal(data);
		} catch (Exception e) {
			// e.printStackTrace();
			throw new Exception(e);
		}
	}

	/**
	 * ��ȡ������ֵ
	 * 
	 * @param key
	 * @param data
	 * @return
	 * @throws Exception
	 * @throws Exception
	 */
	public static String decodeValue( String data) throws Exception {
		byte[] datas;
		String value = null;

		datas = decode(key, Base64.decodeBase64(data));

		value = new String(datas);
		if (value.equals("")) {
			throw new Exception();
		}
		return value;
	}

	public static void main(String[] args) throws Exception {
		String key = "thisismykey";
		String str = "2016/0/4/201601041451894974263.jpg";
		String s = EncryptionUtils.encode( str);
		System.out.println(s);//hCb+ev/rd5DGUwp9EVJBRD9lKNxMQTd3
		String d = EncryptionUtils.decodeValue( "hCb+ev/rd5DGUwp9EVJBRNd1JvpzGZ8bJtrTpf46RrmDoXQYVK8NDw");

		System.out.println(d);

	}

}
