package com.fintechviet.loyalty.service;

import com.fintechviet.loyalty.model.Voucher;
import com.fintechviet.loyalty.repository.VoucherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VoucherServiceImpl implements VoucherService {
    @Autowired
    private VoucherRepository voucherRepository;

    @Override
    public Voucher findById(Integer id) {
        return voucherRepository.findOne(id);
    }

    @Override
    public void save(Voucher voucher) {
        voucherRepository.save(voucher);
    }

    @Override
    public void delete(Voucher voucher) {
        voucherRepository.delete(voucher);
    }

    @Override
    public List<Voucher> getVouchers() {
        return voucherRepository.findAll();
    }

    @Override
    public void updateStatus(Integer id, String status) {
        voucherRepository.updateStatus(status, id);
    }

    @Override
    public String findVoucherCodeByVoucherId(Integer voucherId) {
        return voucherRepository.findVoucherCodeByVoucherId(voucherId);
    }
}
