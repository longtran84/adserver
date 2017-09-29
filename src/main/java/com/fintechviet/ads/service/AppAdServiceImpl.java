package com.fintechviet.ads.service;

import com.fintechviet.ads.dto.AppReportDTO;
import com.fintechviet.ads.dto.InstallReportDTO;
import com.fintechviet.ads.model.AppAd;
import com.fintechviet.ads.repository.AppAdRepository;
import com.fintechviet.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
public class AppAdServiceImpl implements AppAdService {
    @Autowired
    private AppAdRepository appAdRepository;

    @Override
    public void save(AppAd ad) {
        appAdRepository.save(ad);
    }

    @Override
    public void delete(AppAd ad) {
        appAdRepository.delete(ad);
    }

    @Override
    public List<AppAd> getAppAds(String adverEmail) {
        if (StringUtils.isNotEmpty(adverEmail)) {
            return appAdRepository.findByAdvertiser(adverEmail);
        }
        return appAdRepository.findAll();
    }

    @Override
    public void updateStatus(Long id, String status) {
        appAdRepository.updateStatus(status, id);
    }

    @Override
    public List<AppReportDTO> appReport(Date from, Date to, String adverEmail) {
        List<AppReportDTO> reports = new ArrayList<AppReportDTO>();
        List<Object[]> result;

        if (StringUtils.isNotEmpty(adverEmail)) {
            result = appAdRepository.appReportByAdvertiser(from, to, adverEmail);
        } else {
            result = appAdRepository.appReport(from, to);
        }

        for (Object row[] : result) {
            AppAd appAd = (AppAd)row[0];
            long installs = (long)row[1];
            AppReportDTO dto = new AppReportDTO();
            dto.setAppAd(appAd);
            dto.setInstalls(installs);
            reports.add(dto);
        }
        return reports;
    }

    private InstallReportDTO buildInstallDTO(Object row[]){
        String date = (String) row[0];
        BigInteger installs = (BigInteger)row[1];
        InstallReportDTO dto = new InstallReportDTO();
        dto.setDate(date);
        dto.setInstalls(installs);
        return dto;
    }

    @Override
    public List<List<InstallReportDTO>> installsReport(Date from, Date to, long appId) {
        List<InstallReportDTO> iOSReports = new ArrayList<InstallReportDTO>();
        List<InstallReportDTO> androidReports = new ArrayList<InstallReportDTO>();
        List<List<InstallReportDTO>> reports = new ArrayList<List<InstallReportDTO>>();

        List<Object[]> iOSResult = appAdRepository.installsReport(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to), appId, "ios");
        List<Object[]> androidResult = appAdRepository.installsReport(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to), appId, "android");

        for (Object row[] : iOSResult) {
            InstallReportDTO dto = buildInstallDTO(row);
            iOSReports.add(dto);
        }

        for (Object row[] : androidResult) {
            InstallReportDTO dto = buildInstallDTO(row);
            androidReports.add(dto);
        }

        reports.add(iOSReports);
        reports.add(androidReports);
        return  reports;
    }
}
