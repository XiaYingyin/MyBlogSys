package net.sppan.blog.utils;

import javax.crypto.Cipher;
import java.security.Key;
import java.security.Security;

/**
 * 
 * BuildDES
 * 2013-9-18-上午09:53:06
 * Ryon Wang
 * @version 1.0.0
 * 
 */
public class BuildDES {

	//默认key根
	private static final String  DEFAULTKTY = "powerlong";
	//定义加密字符
	private Cipher encryptCipher = null;
	//定义解密字符
	private Cipher decryptCipher = null;
	
	
	/**
	 * getKey(生成密钥)
	 * @param arrBTmp
	 * @return
	 * @throws Exception
	 * Key 从指定字符串生成密钥，密钥所需的字节数组长度为8位 不足8位时后面补0，超出8位只取前8位
	 * @exception 
	 * @since  1.0.0
	*/
	private Key getKey(byte[] arryTemp) throws Exception {
		// 创建一个空的8位字节数组（默认值为0）
		byte[] arryB = new byte[8];
		// 将原始字节数组转换为8位
		for (int i = 0; i < arryTemp.length && i < arryB.length; i++) {
			arryB[i] = arryTemp[i];
		}
		// 生成密钥
		Key key = new javax.crypto.spec.SecretKeySpec(arryB, "DES");
		return key;
	}
	
	/**
	 * 创建一个新的实例 BuildDES.
	 *
	 * @throws Exception
	 */
	public BuildDES() throws Exception {
		this(DEFAULTKTY);
	}
	
	
	/**
	 * 创建一个新的实例 BuildDES.
	 * 带参构造方法，提供给无参调用
	 * @param strKey
	 * @throws Exception
	 */
	@SuppressWarnings("restriction")
	public BuildDES(String strKey) throws Exception {
		Security.addProvider(new com.sun.crypto.provider.SunJCE());
		//将key转换字节保存
		Key key = getKey(strKey.getBytes());
		//实例对象DES
		encryptCipher = Cipher.getInstance("DES");
		//初始化加密
		encryptCipher.init(Cipher.ENCRYPT_MODE, key);
		//初始化解密
		decryptCipher = Cipher.getInstance("DES");
		decryptCipher.init(Cipher.DECRYPT_MODE, key);
	}
	/**
	 * byteArr2HexStr(将byte数组转换为表示16进制值的字符串)
	 * @param arrB
	 * @return
	 * @throws Exception
	 * String
	 * @exception 
	 * @since  1.0.0
	*/
	private String byteArr2HexStr(byte[] arrB) throws Exception {
		int iLen = arrB.length;
		// 每个byte用两个字符才能表示，所以字符串的长度是数组长度的两倍
		StringBuffer sb = new StringBuffer(iLen * 2);
		for (int i = 0; i < iLen; i++) {
			int intTmp = arrB[i];
			// 把负数转换为正数
			while (intTmp < 0) {
				intTmp = intTmp + 256;
			}
			// 小于0F的数需要在前面补0
			if (intTmp < 16) {
				sb.append("0");
			}
			sb.append(Integer.toString(intTmp, 16));
		}
		return sb.toString();
	}
	/**
	 * hexStr2ByteArr(将表示16进制值的字符串转换为byte数组)
	 * @param strIn
	 * @return
	 * @throws Exception
	 * byte[]
	 * @exception 
	 * @since  1.0.0
	*/
	private byte[] hexStr2ByteArr(String strIn) throws Exception {
		byte[] arrB = strIn.getBytes();
		int iLen = arrB.length;
		// 两个字符表示一个字节，所以字节数组长度是字符串长度除以2
		byte[] arrOut = new byte[iLen / 2];
		for (int i = 0; i < iLen; i = i + 2) {
			String strTmp = new String(arrB, i, 2);
			arrOut[i / 2] = (byte) Integer.parseInt(strTmp, 16);
		}
		return arrOut;
	}

	/**
	 * encrypt(加密字节数组)
	 * @param arrB
	 * @return
	 * @throws Exception
	 * byte[]
	 * @exception 
	 * @since  1.0.0
	*/
	private byte[] encrypt(byte[] arrB) throws Exception {
		return encryptCipher.doFinal(arrB);
	}
	/**
	 * encrypt(加密字符串)
	 * @param strIn
	 * @return
	 * @throws Exception
	 * String
	 * @exception 
	 * @since  1.0.0
	*/
	public String encrypt(String strIn) throws Exception {
		return byteArr2HexStr(encrypt(strIn.getBytes()));
	}


	/**
	 * decrypt(解密字节数组)
	 * @param arrB
	 * @return
	 * @throws Exception
	 * byte[]
	 * @exception 
	 * @since  1.0.0
	*/
	private byte[] decrypt(byte[] arrB) throws Exception {
		return decryptCipher.doFinal(arrB);
	}

	
	/**
	 * decrypt(解密字符串)
	 * @param strIn
	 * @return
	 * @throws Exception
	 * String
	 * @exception 
	 * @since  1.0.0
	*/
	public String decrypt(String strIn) throws Exception {
		return new String(decrypt(hexStr2ByteArr(strIn)));
	}
	
	public static void main(String[] args) throws Exception {
		BuildDES des =new BuildDES();
		System.out.println(des.encrypt("3207320798000008305"));

	}

}
