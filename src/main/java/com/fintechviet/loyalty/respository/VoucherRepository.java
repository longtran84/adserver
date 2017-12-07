package com.fintechviet.loyalty.respository;

import com.fintechviet.loyalty.model.Voucher;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


public interface VoucherRepository extends JpaRepository<Voucher, Integer> {
    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE Voucher SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Integer id);

    @Query(value = "SELECT code FROM voucher_codes vc WHERE vc.isDeliver = 0 AND vc.voucherId = :voucherId ORDER BY vc.id ASC LIMIT 0, 1", nativeQuery = true)
    String findVoucherCodeByVoucherId(@Param("voucherId") Integer voucherId);
}
