package com.fintechviet.ads.service;

import com.fintechviet.ads.dto.*;
import com.fintechviet.ads.model.Campaign;

import java.util.Date;
import java.util.List;

public interface CampaignService {
    void save(Campaign campaign);
    void delete(Campaign campaign);
    void delete(Long id);
    Campaign getById(Long id);
    List<Campaign> getAllCampaigns();
    void updateStatus(Long id, String status);
    List<CampaignReportDTO> campaignReport(Date from, Date to);
    List<ImpressionReportDTO> impressionsReport(Date from, Date to, long campaignId);
    List<ClickReportDTO> clicksReport(Date from, Date to, long campaignId);
    List<CTRReportDTO> ctrReport(Date from, Date to, long campaignId);
    List<ViewReportDTO> viewReport(Date from, Date to, long campaignId);
    List<CostReportDTO> costReport(Date from, Date to);
    List<InventoryReportDTO> inventoryReport(Date from, Date to);
}
