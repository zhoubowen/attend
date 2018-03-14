package com.attend.constant;

/**
 */
public enum ErrorCodeEnum {
    PARAM_NULL(10000, "必要参数为空"),
    LGOIN_ACCOUNT_NULL(10001, "账号为空"),
    LOGIN_PASSWORD_NULL(10002, "密码为空"),
    LOGIN_ERROR(100003, "账号或密码错误")
    ;







    private int code;
    private String msg;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    ErrorCodeEnum(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }
}
