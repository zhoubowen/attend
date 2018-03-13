package com.attend.response;

/**
 * Created by bowen on 2018-03-06 23:10
 */
public class SuccessResponse<T> extends BaseResponse {
    public SuccessResponse() {
        this("",null);
    }
    public SuccessResponse(String msg){
        this(msg,null);
    }
    public SuccessResponse(T body){
        this("",body);
    }
    public SuccessResponse(String msg, T body){
        super(true, SUCCESS_CODE, msg, "");
        setBody(body);
    }
    public static SuccessResponse newInstance(){
        return new SuccessResponse();
    }
    public static SuccessResponse newInstance(String msg){
        return new SuccessResponse(msg);
    }
    public static <T> SuccessResponse<T> newInstance(T body){
        return new SuccessResponse(body);
    }
}
