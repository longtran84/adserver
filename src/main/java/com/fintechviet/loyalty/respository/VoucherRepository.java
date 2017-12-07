package com.fintechviet.loyalty.respository;

import com.fintechviet.loyalty.model.Phonecard;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


public interface PhonecardRepository extends JpaRepository<Phonecard, Long> {
    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE Phonecard SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Integer id);
}
