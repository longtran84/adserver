package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Creative;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

public interface CreativeRepository extends JpaRepository<Creative, Long> {
    @Query("SELECT cre FROM Creative cre WHERE LOWER(cre.template) = LOWER(:template)")
    List<Creative> findByTemplate(@Param("template") String template);

    @Query("SELECT cre FROM Creative cre WHERE cre.advertiser.email = :email AND LOWER(cre.template) = LOWER(:template)")
    List<Creative> findByAdvertiserAndTemplate(@Param("email") String email, @Param("template") String template);
    
    @Query("SELECT cre FROM Creative cre WHERE cre.advertiser.email = :email")
    List<Creative> findByAdvertiser(@Param("email") String email);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE Creative SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);
}
