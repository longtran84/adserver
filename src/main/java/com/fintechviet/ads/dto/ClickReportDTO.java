package com.fintechviet.ads.dto;

import java.math.BigInteger;

/**
 * Created by tungn on 9/8/2017.
 */
public class ClickReportDTO {
    private String date;
    private BigInteger clicks;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public BigInteger getClicks() {
        return clicks;
    }

    public void setClicks(BigInteger clicks) {
        this.clicks = clicks;
    }
}
