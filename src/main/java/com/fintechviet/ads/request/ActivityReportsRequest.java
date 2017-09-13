package com.fintechviet.ads.request;

/**
 * Created by tungn on 9/8/2017.
 */
public class ActivityReportsRequest {
    private String dateFrom;
    private String dateTo;
    private long campaignId;

    public String getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(String dateFrom) {
        this.dateFrom = dateFrom;
    }

    public String getDateTo() {
        return dateTo;
    }

    public void setDateTo(String dateTo) {
        this.dateTo = dateTo;
    }

    public long getCampaignId() {
        return campaignId;
    }

    public void setCampaignId(long campaignId) {
        this.campaignId = campaignId;
    }
}
