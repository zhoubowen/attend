package com.attend.response;

import java.io.Serializable;

/**
 */
public class BaseResponse<T> implements Serializable{

    public static final int SUCCESS_CODE = 1;
    public static final int ERROR_CODE = 0;
    //成功或失败
    private boolean             success = true;
    //信息
    private String              msg = "";
    //业务扩展码：可以用于错误码
    private Integer             bizCode = SUCCESS_CODE;
    //扩展信息
    private String              bizInfo = "";
    //实际的数据
    private T                   body;


    public BaseResponse() {
        super();
    }

    public BaseResponse(boolean success, Integer bizCode, String msg, String bizInfo) {
        super();
        this.success = success;
        this.bizCode = bizCode;
        this.msg = msg;
        this.bizInfo = bizInfo;
    }

    public BaseResponse(boolean success, String msg, Integer bizCode, String bizInfo, T body) {
        super();
        this.success = success;
        this.msg = msg;
        this.bizCode = bizCode;
        this.bizInfo = bizInfo;
        this.body = body;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getBizCode() {
        return bizCode;
    }

    public void setBizCode(Integer bizCode) {
        this.bizCode = bizCode;
    }

    public String getBizInfo() {
        return bizInfo;
    }

    public void setBizInfo(String bizInfo) {
        this.bizInfo = bizInfo;
    }

    public T getBody() {
        return body;
    }

    public void setBody(T body) {
        this.body = body;
    }
}
