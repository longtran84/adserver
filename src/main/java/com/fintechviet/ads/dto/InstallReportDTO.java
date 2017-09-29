package com.fintechviet.ads.dto;

import java.math.BigInteger;

/**
 * Created by tungn on 9/8/2017.
 */
public class InstallReportDTO {
    private String date;
    private BigInteger installs;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public BigInteger getInstalls() {
        return installs;
    }

    public void setInstalls(BigInteger installs) {
        this.installs = installs;
    }
}
