package com.fintechviet.content.repository;

import com.fintechviet.content.model.ContentDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ContentDetailsRepository extends JpaRepository<ContentDetails, Long> {
    @Query("SELECT MAX(ctd.order) FROM ContentDetails ctd WHERE ctd.content.id = :contentId")
    Integer findMaxOrder(@Param("contentId") Long contentId);
}
