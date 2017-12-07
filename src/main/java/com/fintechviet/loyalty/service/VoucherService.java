package com.fintechviet.loyalty.service;

import com.fintechviet.loyalty.model.Voucher;

import java.util.List;

public interface VoucherService {
    Voucher findById(Integer id);
    void save(Voucher voucher);
    void delete(Voucher voucher);
    void updateStatus(Integer id, String status);
    List<Voucher> getVouchers();
    String findVoucherCodeByVoucherId(Integer voucherId);
}
