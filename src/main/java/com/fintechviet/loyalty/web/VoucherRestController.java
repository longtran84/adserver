package com.fintechviet.loyalty.web;

import com.fintechviet.loyalty.model.Voucher;
import com.fintechviet.loyalty.service.VoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tungn on 9/12/2017.
 */
@RestController
public class VoucherRestController {
    @Autowired
    private VoucherService voucherService;

    @RequestMapping(value = "/loyalty/vouchers", method = RequestMethod.GET)
    public List<Voucher> vouchers(){
        return voucherService.getVouchers();
    }


    @RequestMapping(value = "/loyalty/voucher/deleteVoucher", method = RequestMethod.POST)
    public ResponseEntity<?> deletePhoneCard(@RequestBody Voucher voucher) {
        try {
            voucherService.delete(voucher);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(voucher);
    }
    
    @RequestMapping(value = "/loyalty/phoneCard/activateVoucher", method = RequestMethod.POST)
    public ResponseEntity<?> activateGame(@RequestBody Voucher voucher) {
        try {
            String status = voucher.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            voucherService.updateStatus(voucher.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(voucher.getId());
    }
    
}

