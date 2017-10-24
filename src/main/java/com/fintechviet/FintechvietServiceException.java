package com.fintechviet;

/**
 * Created by tungn on 10/23/2017.
 */
public class FintechvietServiceException extends Exception {

    private int errorCode;
    private String errorMsg;

    public FintechvietServiceException(ExceptionCodes code) {
        this.errorMsg = code.getMsg();
        this.errorCode = code.getId();
    }

    public int getErrorCode() {
        return errorCode;
    }

    public String getErrorMsg() {
        return errorMsg;
    }
}