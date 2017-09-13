package com.fintechviet.ads.dto;

import com.fintechviet.ads.model.Campaign;

/**
 * Created by tungn on 9/7/2017.
 */
public class CampaignReportDTO {
    private Campaign campaign;
    private long impressions;
    private long clicks;
    private long views;
    private String ctr;

    public Campaign getCampaign() {
        return campaign;
    }

    public void setCampaign(Campaign campaign) {
        this.campaign = campaign;
    }

    public long getImpressions() {
        return impressions;
    }

    public void setImpressions(long impressions) {
        this.impressions = impressions;
    }

    public long getClicks() {
        return clicks;
    }

    public void setClicks(long clicks) {
        this.clicks = clicks;
    }

    public String getCtr() {
        return ctr;
    }

    public void setCtr(String ctr) {
        this.ctr = ctr;
    }

    public long getViews() {
        return views;
    }

    public void setViews(long views) {
        this.views = views;
    }
}
