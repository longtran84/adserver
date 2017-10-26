package com.fintechviet.ads.web;

import com.fintechviet.ads.dto.AppReportDTO;
import com.fintechviet.ads.dto.InstallReportDTO;
import com.fintechviet.ads.model.AppAd;
import com.fintechviet.ads.request.ActivityAppReportsRequest;
import com.fintechviet.ads.request.ReportsRequest;
import com.fintechviet.ads.service.AppAdService;
import com.fintechviet.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class AppAdRestController {
    @Autowired
    private AppAdService appAdService;

    @RequestMapping(path = "/appAds", method = RequestMethod.GET)
    public List<AppAd> getCreativeVideos(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> (r.getAuthority().equals("ROLE_ADMIN") || r.getAuthority().equals("ROLE_SUPER_ADMIN")));
        if (hasAdminRole) {
            return appAdService.getAppAds("");
        } else {
            return appAdService.getAppAds(auth.getName());
        }
    }

    @RequestMapping(value = "/deleteAppAd", method = RequestMethod.POST)
    public ResponseEntity<?> deleteAppAd(@RequestBody AppAd appAd) {
        try {
            appAdService.delete(appAd);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(appAd.getId());
    }

    @RequestMapping(value = "/activateAppAd", method = RequestMethod.POST)
    public ResponseEntity<?> activateAppAd(@RequestBody AppAd appAd) {
        try {
            String status = appAd.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            appAdService.updateStatus(appAd.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(appAd.getId());
    }

    @RequestMapping(value = "/appReports", method = RequestMethod.POST)
    public List<AppReportDTO> appReports(@RequestBody ReportsRequest request){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo() + " 23:59:59");
        boolean hasAdminRole = auth.getAuthorities().stream()
                .anyMatch(r -> r.getAuthority().equals("ROLE_ADMIN"));
        if (hasAdminRole) {
            return appAdService.appReport(from, to, "");
        } else {
            return appAdService.appReport(from, to, auth.getName());
        }
    }

    @RequestMapping(value = "/installReport", method = RequestMethod.POST)
    public List<List<InstallReportDTO>> installReport(@RequestBody ActivityAppReportsRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo()  + " 23:59:59");
        return appAdService.installsReport(from, to, request.getAppId());
    }
}
