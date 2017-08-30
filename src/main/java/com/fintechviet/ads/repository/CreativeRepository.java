package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.Creative;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CreativeRepository extends JpaRepository<Creative, Long> {
    @Query("SELECT cre FROM Creative cre WHERE LOWER(cre.template) = LOWER(:template)")
    List<Creative> findByTemplate(@Param("template") String template);
}
