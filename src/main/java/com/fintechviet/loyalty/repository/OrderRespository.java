package com.fintechviet.loyalty.repository;

import com.fintechviet.loyalty.model.OrderLoyalty;
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
 * Created by tungn on 11/13/2017.
 */
public interface OrderRespository extends JpaRepository<OrderLoyalty, Long> {
    //Query order by range date
    @Query("SELECT o FROM OrderLoyalty o WHERE o.createdDate BETWEEN :from AND :to")
    List<OrderLoyalty> getOrders(@Param("from") @Temporal(TemporalType.TIMESTAMP) Date from, @Param("to") @Temporal(TemporalType.TIMESTAMP) Date to);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE OrderLoyalty SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE OrderLoyalty SET processInstanceId = :processInstanceId WHERE id = :id")
    void updateProcessInstanceId(@Param("processInstanceId") String processInstanceId, @Param("id") Long id);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE Voucher SET quantity = quantity - :quantity WHERE id = :id")
    void updateVoucherQuantity(@Param("quantity") Integer quantity, @Param("id") int id);
}
