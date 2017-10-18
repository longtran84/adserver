package com.fintechviet.content.repository;


import com.fintechviet.content.model.News;
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


/**
 * Created by tungn on 9/12/2017.
 */
public interface NewsRepository extends JpaRepository<News, Long> {
    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE News SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);

    //Query news by range date and admin
    @Query("SELECT n FROM News n WHERE n.createdDate BETWEEN :from AND :to")
    List<News> getNewsByDate(@Param("from") @Temporal(TemporalType.TIMESTAMP) Date from, @Param("to") @Temporal(TemporalType.TIMESTAMP) Date to);
}
