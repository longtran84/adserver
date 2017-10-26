package com.fintechviet.content.repository;

import com.fintechviet.content.model.InAppMessage;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

public interface InAppMessageRepository extends JpaRepository<InAppMessage, Long> {
    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE InAppMessage SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);
}
