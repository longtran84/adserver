package com.fintechviet.ads.dto;

import java.math.BigInteger;

/**
 * Created by tungn on 9/8/2017.
 */
public class ViewReportDTO {
    private String date;
    private BigInteger views;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public BigInteger getViews() {
        return views;
    }

    public void setViews(BigInteger views) {
        this.views = views;
    }
}
