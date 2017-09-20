package com.fintechviet.content.repository;


import com.fintechviet.content.model.News;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Temporal;
import org.springframework.data.repository.query.Param;

import javax.persistence.TemporalType;
import java.util.Date;
import java.util.List;


/**
 * Created by tungn on 9/12/2017.
 */
public interface NewsRepository extends JpaRepository<News, Long> {
    News findByOriginalId(long id);
    //Query cost by range date and admin
    @Query("SELECT n FROM News n WHERE n.createdDate BETWEEN :from AND :to")
    List<News> getNewsByDate(@Param("from") @Temporal(TemporalType.TIMESTAMP) Date from, @Param("to") @Temporal(TemporalType.TIMESTAMP) Date to);
}
