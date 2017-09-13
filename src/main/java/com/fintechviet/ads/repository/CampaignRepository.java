package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Campaign;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Temporal;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.TemporalType;
import java.util.Date;
import java.util.List;

public interface CampaignRepository extends JpaRepository<Campaign, Long> {
    String DATE_RANGE = "(SELECT ADDDATE('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) DATE FROM " +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0," +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1," +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2," +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3," +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4) v ";

    @Query("SELECT cpa FROM Campaign cpa WHERE cpa.advertiser.email = :email")
    List<Campaign> findByAdvertiser(@Param("email") String email);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE Campaign SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);

    //Query campaign activities by range date and admin
    @Query("SELECT cpa, (SELECT COUNT(adi.impression) FROM AdImpressions adi WHERE adi.ad.flight.campaign.id = cpa.id AND adi.date BETWEEN :from AND :to) AS impressions, " +
           "(SELECT COUNT(adc.id) FROM AdClicks adc WHERE adc.ad.flight.campaign.id = cpa.id AND adc.date BETWEEN :from AND :to) AS clicks, " +
           "(SELECT COUNT(adv.id) FROM AdViews adv WHERE adv.ad.flight.campaign.id = cpa.id AND adv.date BETWEEN :from AND :to) AS views " +
           "FROM Campaign cpa WHERE cpa.advertiser.email = :email")
    List<Object[]> campaignReportByAdvertiser(@Param("from") @Temporal(TemporalType.TIMESTAMP) Date from, @Param("to") @Temporal(TemporalType.TIMESTAMP) Date to, @Param("email") String email);

    //Query campaign activities by range date and advertiser
    @Query("SELECT cpa, (SELECT COUNT(adi.impression) FROM AdImpressions adi WHERE adi.ad.flight.campaign.id = cpa.id AND adi.date BETWEEN :from AND :to) AS impressions, " +
            "(SELECT COUNT(adc.id) FROM AdClicks adc WHERE adc.ad.flight.campaign.id = cpa.id AND adc.date BETWEEN :from AND :to) AS clicks, " +
            "(SELECT COUNT(adv.id) FROM AdViews adv WHERE adv.ad.flight.campaign.id = cpa.id AND adv.date BETWEEN :from AND :to) AS views " +
            "FROM Campaign cpa")
    List<Object[]> campaignReport(@Param("from") @Temporal(TemporalType.TIMESTAMP) Date from, @Param("to") @Temporal(TemporalType.TIMESTAMP) Date to);

    //Query impressions of campaign by range date
    @Query(value = "SELECT DATE_FORMAT(v.date, \"%d/%m/%Y\"), COUNT(id) FROM " + DATE_RANGE +
                   "LEFT JOIN ad_impressions adi ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adi.date, \"%d/%m/%Y\") " +
                   "AND adId IN (SELECT a.id FROM ad a INNER JOIN flight f ON a.flightId = f.id WHERE f.campaignId = :campaignId) " +
                   "WHERE v.date BETWEEN :from AND :to " +
                   "GROUP BY DATE_FORMAT(v.date, \"%d/%m/%Y\")", nativeQuery = true)
    List<Object[]> impressionsReport(@Param("from") String from, @Param("to") String to, @Param("campaignId") long campaignId);

    //Query clicks of campaign by range date
    @Query(value = "SELECT DATE_FORMAT(v.date, \"%d/%m/%Y\"), COUNT(id) FROM " + DATE_RANGE +
            "LEFT JOIN ad_clicks adc ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adc.date, \"%d/%m/%Y\") " +
            "AND adId IN (SELECT a.id FROM ad a INNER JOIN flight f ON a.flightId = f.id WHERE f.campaignId = :campaignId) " +
            "WHERE v.date BETWEEN :from AND :to " +
            "GROUP BY DATE_FORMAT(v.date, \"%d/%m/%Y\")", nativeQuery = true)
    List<Object[]> clicksReport(@Param("from") String from, @Param("to") String to, @Param("campaignId") long campaignId);

    //Query CTR of campaign by range date
    @Query(value = "SELECT DATE_FORMAT(v.date, \"%d/%m/%Y\"), COUNT(DISTINCT adc.id) clicks, COUNT(DISTINCT adi.id) impressions FROM " + DATE_RANGE +
            "LEFT JOIN ad_clicks adc ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adc.date, \"%d/%m/%Y\") " +
            "AND adc.adId IN (SELECT a.id FROM ad a INNER JOIN flight f ON a.flightId = f.id WHERE f.campaignId = :campaignId) " +
            "LEFT JOIN ad_impressions adi ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adi.date, \"%d/%m/%Y\") " +
            "AND adi.adId IN (SELECT a.id FROM ad a INNER JOIN flight f ON a.flightId = f.id WHERE f.campaignId = :campaignId) " +
            "WHERE v.date BETWEEN :from AND :to " +
            "GROUP BY DATE_FORMAT(v.date, \"%d/%m/%Y\")", nativeQuery = true)
    List<Object[]> ctrReport(@Param("from") String from, @Param("to") String to, @Param("campaignId") long campaignId);

    //Query view video of campaign by range date
    @Query(value = "SELECT DATE_FORMAT(v.date, \"%d/%m/%Y\"), COUNT(id) FROM " + DATE_RANGE +
            "LEFT JOIN ad_views adv ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adv.date, \"%d/%m/%Y\") " +
            "AND adId IN (SELECT a.id FROM ad a INNER JOIN flight f ON a.flightId = f.id WHERE f.campaignId = :campaignId) " +
            "WHERE v.date BETWEEN :from AND :to " +
            "GROUP BY DATE_FORMAT(v.date, \"%d/%m/%Y\")", nativeQuery = true)
    List<Object[]> viewsReport(@Param("from") String from, @Param("to") String to, @Param("campaignId") long campaignId);

    //Query cost by range date and admin
    @Query(value="SELECT DATE_FORMAT(v.date, \"%d/%m/%Y\"), COUNT(DISTINCT adi.id) impressions, COUNT(DISTINCT adc.id) clicks, " +
            "COUNT(DISTINCT adv.id) views, COUNT(DISTINCT cpi.id) cpiTotal, COUNT(DISTINCT cpe.id) cpeTotal FROM " + DATE_RANGE +
            "LEFT JOIN ad_clicks adc ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adc.date, \"%d/%m/%Y\") " +
            "LEFT JOIN ad_impressions adi ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adi.date, \"%d/%m/%Y\") " +
            "LEFT JOIN ad_views adv ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adv.date, \"%d/%m/%Y\") " +
            "LEFT JOIN Cpi cpi ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(cpi.date, \"%d/%m/%Y\") " +
            "LEFT JOIN Cpe cpe ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(cpe.date, \"%d/%m/%Y\") " +
            "WHERE v.date BETWEEN :from AND :to " +
            "GROUP BY DATE_FORMAT(v.date, \"%d/%m/%Y\")", nativeQuery = true)
    List<Object[]> costReport(@Param("from") String from, @Param("to") String to);

    //Query inventory by range date and admin
    @Query(value="SELECT DATE_FORMAT(v.date, \"%d/%m/%Y\"), COUNT(DISTINCT coi.id) content_impressions, COUNT(DISTINCT coc.id) content_clicks, " +
            "COUNT(DISTINCT adi.id) impressions, COUNT(DISTINCT adc.id) clicks, " +
            "COUNT(DISTINCT adv.id) views, COUNT(DISTINCT cpi.id) cpiTotal, COUNT(DISTINCT cpe.id) cpeTotal FROM " + DATE_RANGE +
            "LEFT JOIN ad_clicks adc ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adc.date, \"%d/%m/%Y\") " +
            "LEFT JOIN ad_impressions adi ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adi.date, \"%d/%m/%Y\") " +
            "LEFT JOIN ad_views adv ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(adv.date, \"%d/%m/%Y\") " +
            "LEFT JOIN cpi cpi ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(cpi.date, \"%d/%m/%Y\") " +
            "LEFT JOIN cpe cpe ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(cpe.date, \"%d/%m/%Y\") " +
            "LEFT JOIN content_impressions coi ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(coi.date, \"%d/%m/%Y\") " +
            "LEFT JOIN content_clicks coc ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(coc.date, \"%d/%m/%Y\") " +
            "WHERE v.date BETWEEN :from AND :to " +
            "GROUP BY DATE_FORMAT(v.date, \"%d/%m/%Y\")", nativeQuery = true)
    List<Object[]> inventoryReport(@Param("from") String from, @Param("to") String to);
}
