package com.attend.util;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by bowen on 2018-02-27 19:24
 */
public class MD5Util {

    /**
     * 利用MD5进行加密
     *
     * @param str 待加密的字符串
     * @return 加密后的字符串
     * @throws NoSuchAlgorithmException     没有这种产生消息摘要的算法
     * @throws UnsupportedEncodingException
     */
    public static String EncoderByMd5(String str) {
        MessageDigest md5 = null;
        BASE64Encoder base64en = null;
        try {
            //确定计算方法
            md5 = MessageDigest.getInstance("MD5");
            base64en = new BASE64Encoder();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        String newstr = null;

        try {
            //加密后的字符串
            newstr = base64en.encode(md5.digest(str.getBytes("utf-8")));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return newstr;
    }

    /**
     * 判断用户密码是否正确
     * @param newpasswd  用户输入的密码
     * @param oldpasswd  数据库中存储的密码－－用户密码的摘要
     * @return
     * @throws NoSuchAlgorithmException
     *  @throws UnsupportedEncodingException
     */
    public static boolean checkPassword(String newpasswd, String oldpasswd) {
        if (EncoderByMd5(newpasswd).equals(oldpasswd)){
            return true;
        } else{
            return false;
        }
    }

}
