package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.AppAd;
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

public interface AppAdRepository extends JpaRepository<AppAd, Long> {
    String DATE_RANGE = "(SELECT ADDDATE('1970-01-01',t4.i*10000 + t3.i*1000 + t2.i*100 + t1.i*10 + t0.i) DATE FROM " +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t0," +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t1," +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t2," +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t3," +
            " (SELECT 0 i UNION SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9) t4) v ";

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE AppAd SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);

    //Query app install by range date
    @Query("SELECT apa, (SELECT COUNT(aai.appAdId) FROM AppAdInstalls aai WHERE aai.appAdId = apa.id AND aai.date BETWEEN :from AND :to) AS installs " +
            "FROM AppAd apa")
    List<Object[]> appReport(@Param("from") @Temporal(TemporalType.TIMESTAMP) Date from, @Param("to") @Temporal(TemporalType.TIMESTAMP) Date to);

    //Query platform install by range date
    @Query(value = "SELECT DATE_FORMAT(v.date, \"%d/%m/%Y\"), COUNT(id) FROM " + DATE_RANGE +
            "LEFT JOIN app_ad_installs aai ON DATE_FORMAT(v.date, \"%d/%m/%Y\") = DATE_FORMAT(aai.date, \"%d/%m/%Y\") " +
            "WHERE v.date BETWEEN :from AND :to AND aai.appAdId = :appId AND aai.platform = :platform " +
            "GROUP BY DATE_FORMAT(v.date, \"%d/%m/%Y\")", nativeQuery = true)
    List<Object[]> installsReport(@Param("from") String from, @Param("to") String to, @Param("appId") long appId, @Param("platform") String platform);
}
