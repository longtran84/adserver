package com.fintechviet;

/**
 * Created by tungn on 10/23/2017.
 */
public enum  ExceptionCodes {
    INVALID_REQUEST(0, "The request is invalid"),
    MISSING_PARAMETER(1, "Required query parameter is missing"),
    MISSING_HEADER(2, "Required header is missing");

    private final int id;
    private final String msg;

    ExceptionCodes(int id, String msg) {
        this.id = id;
        this.msg = msg;
    }

    public int getId() {
        return this.id;
    }

    public String getMsg() {
        return this.msg;
    }
}
