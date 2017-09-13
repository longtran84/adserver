package com.fintechviet.ads.dto;

import java.math.BigInteger;

/**
 * Created by tungn on 9/8/2017.
 */
public class ImpressionReportDTO {
    private String date;
    private BigInteger impressions;

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public BigInteger getImpressions() {
        return impressions;
    }

    public void setImpressions(BigInteger impressions) {
        this.impressions = impressions;
    }
}
