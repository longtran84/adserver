package com.fintechviet.ads.service;

import com.fintechviet.ads.dto.*;
import com.fintechviet.ads.model.Ad;
import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.model.Flight;
import com.fintechviet.ads.repository.AdRepository;
import com.fintechviet.ads.repository.CampaignRepository;
import com.fintechviet.ads.repository.FlightRepository;
import com.fintechviet.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.*;

@Service
public class CampaignServiceImpl implements CampaignService {
    @Value("${cpmPrice}")
    private double cpmPrice;
    @Value("${cpcPrice}")
    private double cpcPrice;
    @Value("${cpvPrice}")
    private double cpvPrice;
    @Value("${cpiPrice}")
    private double cpiPrice;
    @Value("${cpePrice}")
    private double cpePrice;

    @Autowired
    private CampaignRepository campaignRepository;
    @Autowired
    private FlightRepository flightRepository;
    @Autowired
    private AdRepository adRepository;

    @Override
    public void save(Campaign campaign) {
        campaignRepository.save(campaign);
    }

    @Override
    public void delete(Campaign campaign) {
        campaignRepository.delete(campaign);
    }

    @Override
    public List<Campaign> getAllCampaigns() {
        return campaignRepository.findAll();
    }


    @Override
    public Campaign getById(Long id) {
        return campaignRepository.findOne(id);
    }

    @Override
    public void updateStatus(Long id, String status) {
        campaignRepository.updateStatus(status, id);
        if ("INACTIVE".equals(status)) {
            Campaign campaign = campaignRepository.findOne(id);
            Set<Flight> flights = campaign.getFlights();
            flights.stream().forEach(flight -> {
                flight.setStatus("INACTIVE");
                Set<Ad> ads = flight.getAds();
                ads.stream().forEach(ad -> ad.setStatus("INACTIVE"));
                adRepository.save(ads);
            });
            flightRepository.save(flights);
        }
    }

    @Override
    public List<CampaignReportDTO> campaignReport(Date from, Date to) {
        List<CampaignReportDTO> reports = new ArrayList<CampaignReportDTO>();
        List<Object[]> result;

        result = campaignRepository.campaignReport(from, to);

        for (Object row[] : result) {
            Campaign campaign = (Campaign)row[0];
            long impressions = (long)row[1];
            long clicks = (long)row[2];
            double ctr = 0;
            if (impressions != 0) {
                ctr = (double)((clicks/impressions) * 100);
            }
            long views = (long)row[3];
            CampaignReportDTO dto = new CampaignReportDTO();
            dto.setCampaign(campaign);
            dto.setImpressions(impressions);
            dto.setClicks(clicks);
            dto.setCtr(ctr + "%");
            dto.setViews(views);
            reports.add(dto);
        }
        return reports;
    }

    @Override
    public List<CostReportDTO> costReport(Date from, Date to) {
        List<CostReportDTO> reports = new ArrayList<CostReportDTO>();
        List<Object[]> result;

        result = campaignRepository.costReport(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to));

        for (Object row[] : result) {
            String date = (String)row[0];
            BigInteger impressions = (BigInteger)row[1];
            BigInteger clicks = (BigInteger)row[2];
            BigInteger views = (BigInteger)row[3];
            BigInteger cpi = (BigInteger)row[4];
            BigInteger cpe = (BigInteger)row[5];
            CostReportDTO dto = new CostReportDTO();
            dto.setDate(DateUtils.convertStringToOnlyDate(date));
            dto.setTotalCPM(impressions.longValue() * cpmPrice);
            dto.setTotalCPC(clicks.longValue() * cpcPrice);
            dto.setTotalCPV(views.longValue() * cpvPrice);
            dto.setTotalCPI(cpi.longValue() * cpiPrice);
            dto.setTotalCPE(cpe.longValue() * cpePrice);
            dto.setTotalCost(dto.getTotalCPM() + dto.getTotalCPC() + dto.getTotalCPV() + dto.getTotalCPI() + dto.getTotalCPE());
            reports.add(dto);
        }
        return reports;
    }

    @Override
    public List<InventoryReportDTO> inventoryReport(Date from, Date to) {
        List<InventoryReportDTO> reports = new ArrayList<InventoryReportDTO>();
        List<Object[]> result;

        result = campaignRepository.inventoryReport(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to));

        for (Object row[] : result) {
            String date = (String)row[0];
            BigInteger content_impressions = (BigInteger)row[1];
            BigInteger content_clicks = (BigInteger)row[2];
            BigInteger impressions = (BigInteger)row[3];
            BigInteger clicks = (BigInteger)row[4];
            BigInteger views = (BigInteger)row[5];
            BigInteger cpi = (BigInteger)row[6];
            BigInteger cpe = (BigInteger)row[7];
            InventoryReportDTO dto = new InventoryReportDTO();
            dto.setDate(DateUtils.convertStringToOnlyDate(date));
            dto.setTotalImpressions(impressions.add(content_impressions));
            dto.setContentImpressions(content_impressions);
            dto.setContentClicks(content_clicks);
            dto.setAdImpressions(impressions);
            dto.setCpcImpressions(clicks);
            dto.setCpvImpressions(views);
            dto.setCpiImpressions(cpi);
            dto.setCpeImpressions(cpe);
            double contentCTR = 0;
            if (content_impressions.longValue() != 0) {
                contentCTR = (double)(content_clicks.longValue()*100/content_impressions.longValue());
            }
            double cpcCTR = 0;
            double cpvCTR = 0;
            if (impressions.longValue() != 0) {
                cpcCTR = (double)(clicks.longValue()*100/impressions.longValue());
                cpvCTR = (double)(views.longValue()*100/impressions.longValue());
            }

            dto.setContentCTR(contentCTR);
            dto.setCpcCTR(cpcCTR);
            dto.setCpvCTR(cpvCTR);
            reports.add(dto);
        }
        return reports;
    }

    @Override
    public List<ImpressionReportDTO> impressionsReport(Date from, Date to, long campaignId) {
        List<ImpressionReportDTO> reports = new ArrayList<ImpressionReportDTO>();
        List<Object[]> result = campaignRepository.impressionsReport(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to), campaignId);

        for (Object row[] : result) {
            String date = (String) row[0];
            BigInteger impressions = (BigInteger)row[1];
            ImpressionReportDTO dto = new ImpressionReportDTO();
            dto.setDate(date);
            dto.setImpressions(impressions);
            reports.add(dto);
        }

        return  reports;
    }

    @Override
    public List<ClickReportDTO> clicksReport(Date from, Date to, long campaignId) {
        List<ClickReportDTO> reports = new ArrayList<ClickReportDTO>();
        List<Object[]> result = campaignRepository.clicksReport(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to), campaignId);

        for (Object row[] : result) {
            String date = (String) row[0];
            BigInteger clicks = (BigInteger)row[1];
            ClickReportDTO dto = new ClickReportDTO();
            dto.setDate(date);
            dto.setClicks(clicks);
            reports.add(dto);
        }

        return  reports;
    }

    @Override
    public List<CTRReportDTO> ctrReport(Date from, Date to, long campaignId) {
        List<CTRReportDTO> reports = new ArrayList<CTRReportDTO>();
        List<Object[]> result = campaignRepository.ctrReport(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to), campaignId);

        for (Object row[] : result) {
            String date = (String) row[0];
            BigInteger clicks = (BigInteger)row[1];
            BigInteger impressions = (BigInteger)row[2];
            CTRReportDTO dto = new CTRReportDTO();
            dto.setDate(date);
            double ctr = 0;
            if (impressions.longValue() != 0) {
                ctr = (double)(clicks.longValue()*100/impressions.longValue());
            }
            dto.setCTR(ctr);
            reports.add(dto);
        }

        return  reports;
    }

    @Override
    public List<ViewReportDTO> viewReport(Date from, Date to, long campaignId) {
        List<ViewReportDTO> reports = new ArrayList<ViewReportDTO>();
        List<Object[]> result = campaignRepository.viewsReport(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to), campaignId);

        for (Object row[] : result) {
            String date = (String) row[0];
            BigInteger views = (BigInteger)row[1];
            ViewReportDTO dto = new ViewReportDTO();
            dto.setDate(date);
            dto.setViews(views);
            reports.add(dto);
        }

        return  reports;
    }

	@Override
	public void delete(Long id) {
		campaignRepository.delete(id);
	}
}
