package com.fintechviet.ads.dto;

import java.math.BigInteger;
import java.util.Date;

/**
 * Created by tungn on 9/7/2017.
 */
public class InventoryReportDTO {
    private Date date;
    private BigInteger totalImpressions;
    private BigInteger contentImpressions;
    private BigInteger adImpressions;
    private BigInteger cpcImpressions;
    private BigInteger cpvImpressions;
    private BigInteger cpiImpressions;
    private BigInteger cpeImpressions;
    private BigInteger contentClicks;
    private double contentCTR;
    private double cpcCTR;
    private double cpvCTR;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public BigInteger getTotalImpressions() {
        return totalImpressions;
    }

    public void setTotalImpressions(BigInteger totalImpressions) {
        this.totalImpressions = totalImpressions;
    }

    public BigInteger getContentImpressions() {
        return contentImpressions;
    }

    public void setContentImpressions(BigInteger contentImpressions) {
        this.contentImpressions = contentImpressions;
    }

    public BigInteger getAdImpressions() {
        return adImpressions;
    }

    public void setAdImpressions(BigInteger adImpressions) {
        this.adImpressions = adImpressions;
    }

    public BigInteger getCpcImpressions() {
        return cpcImpressions;
    }

    public void setCpcImpressions(BigInteger cpcImpressions) {
        this.cpcImpressions = cpcImpressions;
    }

    public BigInteger getCpvImpressions() {
        return cpvImpressions;
    }

    public void setCpvImpressions(BigInteger cpvImpressions) {
        this.cpvImpressions = cpvImpressions;
    }

    public BigInteger getCpiImpressions() {
        return cpiImpressions;
    }

    public void setCpiImpressions(BigInteger cpiImpressions) {
        this.cpiImpressions = cpiImpressions;
    }

    public BigInteger getCpeImpressions() {
        return cpeImpressions;
    }

    public void setCpeImpressions(BigInteger cpeImpressions) {
        this.cpeImpressions = cpeImpressions;
    }

    public BigInteger getContentClicks() {
        return contentClicks;
    }

    public void setContentClicks(BigInteger contenClicks) {
        this.contentClicks = contenClicks;
    }

    public double getContentCTR() {
        return contentCTR;
    }

    public void setContentCTR(double contentCTR) {
        this.contentCTR = contentCTR;
    }

    public double getCpcCTR() {
        return cpcCTR;
    }

    public void setCpcCTR(double cpcCTR) {
        this.cpcCTR = cpcCTR;
    }

    public double getCpvCTR() {
        return cpvCTR;
    }

    public void setCpvCTR(double cpvCTR) {
        this.cpvCTR = cpvCTR;
    }
}
