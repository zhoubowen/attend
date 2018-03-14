package com.attend.response;

/**
 */
public class ErrorResponse<T> extends BaseResponse {
    public ErrorResponse() {
        this(ERROR_CODE,"失败","");
    }

    public ErrorResponse(String msg) {
        this(ERROR_CODE,msg,"");
    }

    public ErrorResponse(Integer bizCode, String msg) {
        this(bizCode,msg,"");
    }

    public ErrorResponse(String msg, String bizInfo) {
        this(ERROR_CODE,msg,bizInfo);
    }

    public ErrorResponse(Integer bizCode, String msg, String bizInfo) {
        super(false, bizCode, msg, bizInfo);
    }

    public static ErrorResponse newInstance(){
        return new ErrorResponse();
    }
    public static ErrorResponse newInstance(String msg){
        return new ErrorResponse(msg);
    }
    public static ErrorResponse newInstance(int bizCode, String msg){
        return new ErrorResponse(bizCode,msg);
    }

    public static ErrorResponse fastFail(){
        return new ErrorResponse(503,"服务不可用");
    }
}
