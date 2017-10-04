package com.fintechviet.content.repository;

import com.fintechviet.content.model.Game;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


public interface GameRepository extends JpaRepository<Game, Long> {
    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE Game SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Integer id);
}
