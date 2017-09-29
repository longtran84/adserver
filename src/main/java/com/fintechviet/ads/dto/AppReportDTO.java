package com.fintechviet.ads.dto;

import com.fintechviet.ads.model.AppAd;

/**
 * Created by tungn on 9/29/2017.
 */
public class AppReportDTO {
    private AppAd appAd;
    private long installs;

    public AppAd getAppAd() {
        return appAd;
    }

    public void setAppAd(AppAd appAd) {
        this.appAd = appAd;
    }

    public long getInstalls() {
        return installs;
    }

    public void setInstalls(long installs) {
        this.installs = installs;
    }
}
