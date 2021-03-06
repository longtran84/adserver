package com.fintechviet.ads.web;

import com.fintechviet.ads.dto.*;
import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.request.ReportsRequest;
import com.fintechviet.ads.request.ActivityReportsRequest;
import com.fintechviet.ads.service.CampaignService;
import com.fintechviet.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class CampaignRestController {
    @Autowired
    private CampaignService campaignService;

    @RequestMapping(value = "/campaigns", method = RequestMethod.GET)
    public List<Campaign> getAllCampaigns(){
        return campaignService.getAllCampaigns();
    }

    @RequestMapping(value = "/campaignReports", method = RequestMethod.POST)
    public List<CampaignReportDTO> campaignReports(@RequestBody ReportsRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo() + " 23:59:59");
        return campaignService.campaignReport(from, to);
    }

    @RequestMapping(value = "/costReports", method = RequestMethod.POST)
    public List<CostReportDTO> costReports(@RequestBody ReportsRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo() + " 23:59:59");
        return campaignService.costReport(from, to);
    }

    @RequestMapping(value = "/inventoryReports", method = RequestMethod.POST)
    public List<InventoryReportDTO> inventoryReports(@RequestBody ReportsRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo() + " 23:59:59");
        return campaignService.inventoryReport(from, to);
    }

    @RequestMapping(value = "/impressionReport", method = RequestMethod.POST)
    public List<ImpressionReportDTO> impressionReport(@RequestBody ActivityReportsRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo()  + " 23:59:59");
        return campaignService.impressionsReport(from, to, request.getCampaignId());
    }

    @RequestMapping(value = "/clickReport", method = RequestMethod.POST)
    public List<ClickReportDTO> clickReport(@RequestBody ActivityReportsRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo()  + " 23:59:59");
        return campaignService.clicksReport(from, to, request.getCampaignId());
    }

    @RequestMapping(value = "/ctrReport", method = RequestMethod.POST)
    public List<CTRReportDTO> ctrReport(@RequestBody ActivityReportsRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo()  + " 23:59:59");
        return campaignService.ctrReport(from, to, request.getCampaignId());
    }

    @RequestMapping(value = "/viewReport", method = RequestMethod.POST)
    public List<ViewReportDTO> viewReport(@RequestBody ActivityReportsRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo()  + " 23:59:59");
        return campaignService.viewReport(from, to, request.getCampaignId());
    }

    @RequestMapping(value = "/activateCampaign", method = RequestMethod.POST)
    public ResponseEntity<?> activateCampaign(@RequestBody Campaign campaign) {
        try {
            String status = campaign.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            campaignService.updateStatus(campaign.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(campaign.getId());
    }
    
	@RequestMapping(value = "/deleteCampaign/{id}", method=RequestMethod.DELETE)
	public ResponseEntity<?> deleteCampaign(@PathVariable String id) {
		try {
			campaignService.delete(Long.valueOf(id));
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("Error");
		}

		return ResponseEntity.ok(id);
	}
}
