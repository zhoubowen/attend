package com.attend.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


/**
 */
public class ResponseJsonUtil {
	
	private static final Logger log = LoggerFactory
			.getLogger(ResponseJsonUtil.class);


	public static void writeJson2Response(String json,HttpServletResponse response){
		
		response.setContentType("text/json");
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			log.error("将JSON字符串写到输出流时出错", e);
		}
	}
	
	/**
	 * 将JSON字符串写到输出流
	 * @author bowen	
	 * @date 2015年5月6日 上午8:28:44 
	 * @param json
	 * @param request
	 * @param response
	 */
	public static void writeJson2Response(String json,HttpServletRequest request,HttpServletResponse response){
		String cb=request.getParameter("jsoncallback");
		if (!StringUtils.isEmpty(cb)) {
		    response.setContentType("text/javascript");
		    json = cb + "(" + json + ");";
		} else {
		    response.setContentType("text/json");
		}
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			log.error("将JSON字符串写到输出流时出错", e);
		}
	}
	
	public static void writeJson2ResponseForAjax(String json,HttpServletResponse response){
		
//		response.setContentType("text/json");
//		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			log.error("ajax调用时将JSON字符串写到输出流时出错", e);
		}
	}
	/**
	 * 将字符串原样写到输出流
	 */
	public static void writeData2Response(HttpServletRequest request, HttpServletResponse response, String data, String dateType){
		String cb=request.getParameter("jsoncallback");
		if (!StringUtils.isEmpty(cb)) {
		    response.setContentType("text/javascript");
		    data = cb + "(" + data + ");";
		} else {
		    response.setContentType("text/" + dateType);
		}
		response.setHeader("Cache-Control", "no-cache");
		response.setCharacterEncoding("UTF-8");
		try {
			response.getWriter().write(data);
		} catch (IOException e) {
			log.error("将字符串写到输出流时出错", e);
		}
	}
	
	
	public static void main(String[] args){
	}
	
	

}
