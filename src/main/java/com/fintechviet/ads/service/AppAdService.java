package com.fintechviet.ads.service;

import com.fintechviet.ads.dto.AppReportDTO;
import com.fintechviet.ads.dto.InstallReportDTO;
import com.fintechviet.ads.model.AppAd;

import java.util.Date;
import java.util.List;

public interface AppAdService {
    void save(AppAd ad);
    void delete(AppAd ad);
    List<AppAd> getAppAds(String adverEmail);
    void updateStatus(Long id, String status);
    List<AppReportDTO> appReport(Date from, Date to, String adverEmail);
    List<List<InstallReportDTO>> installsReport(Date from, Date to, long appId);
}
