package com.fintechviet.ads.request;

/**
 * Created by tungn on 9/8/2017.
 */
public class ActivityAppReportsRequest {
    private String dateFrom;
    private String dateTo;
    private long appId;

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

    public long getAppId() {
        return appId;
    }

    public void setAppId(long appId) {
        this.appId = appId;
    }
}
