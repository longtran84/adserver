package com.fintechviet.ads.dto;

import java.util.Date;

/**
 * Created by tungn on 9/7/2017.
 */
public class CostReportDTO {
    private Date date;
    private double totalCost;
    private double totalCPM;
    private double totalCPC;
    private double totalCPV;
    private double totalCPI;
    private double totalCPE;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(double totalCost) {
        this.totalCost = totalCost;
    }

    public double getTotalCPM() {
        return totalCPM;
    }

    public void setTotalCPM(double totalCPM) {
        this.totalCPM = totalCPM;
    }

    public double getTotalCPC() {
        return totalCPC;
    }

    public void setTotalCPC(double totalCPC) {
        this.totalCPC = totalCPC;
    }

    public double getTotalCPV() {
        return totalCPV;
    }

    public void setTotalCPV(double totalCPV) {
        this.totalCPV = totalCPV;
    }

    public double getTotalCPI() {
        return totalCPI;
    }

    public void setTotalCPI(double totalCPI) {
        this.totalCPI = totalCPI;
    }

    public double getTotalCPE() {
        return totalCPE;
    }

    public void setTotalCPE(double totalCPE) {
        this.totalCPE = totalCPE;
    }
}
