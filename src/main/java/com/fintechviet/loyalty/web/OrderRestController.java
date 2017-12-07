package com.fintechviet.loyalty.web;

import com.fintechviet.loyalty.model.OrderLoyalty;
import com.fintechviet.loyalty.request.OrderRequest;
import com.fintechviet.loyalty.service.OrderService;
import com.fintechviet.user_mobile.service.UserMobileService;
import com.fintechviet.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

/**
 * Created by tungn on 9/12/2017.
 */
@RestController
public class OrderRestController {
    @Autowired
    private OrderService orderService;

    @Autowired
    private UserMobileService userMobileService;

    @RequestMapping(value = "/loyalty/orders", method = RequestMethod.POST)
    public List<OrderLoyalty> orders(@RequestBody OrderRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo() + " 23:59:59");
        return orderService.getOrders(from, to);
    }

//    @RequestMapping(value = "/loyalty/order/process", method = RequestMethod.POST)
//    public ResponseEntity<?> processOrder(@RequestBody OrderLoyalty order) {
//        try {
//            String status = "PROCESSING";
//            orderService.updateStatus(order.getId(), status);
//        } catch (Exception ex) {
//            return ResponseEntity.badRequest().body("Error");
//        }
//        return ResponseEntity.ok(order.getId());
//    }

    @RequestMapping(value = "/loyalty/order/process", method = RequestMethod.POST)
    public ResponseEntity<?> processOrder(@RequestBody OrderLoyalty order) {
        orderService.processOrder(order);
        return ResponseEntity.ok(order.getId());
    }

    @RequestMapping(value = "/loyalty/order/approve", method = RequestMethod.POST)
    public ResponseEntity<?> approve(@RequestBody OrderLoyalty order) {
        try {
            orderService.approveOrder(order);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(order.getId());
    }

    @RequestMapping(value = "/loyalty/order/cancel", method = RequestMethod.POST)
    public ResponseEntity<?> cancel(@RequestBody OrderLoyalty order) {
        try {
            orderService.cancelOrder(order.getProcessInstanceId());
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(order.getId());
    }

    @RequestMapping(value = "/loyalty/order/shipSuccess", method = RequestMethod.POST)
    public ResponseEntity<?> shipSuccess(@RequestBody OrderLoyalty order) {
        try {
            orderService.shipSuccessOrder(order);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(order.getId());
    }

    @RequestMapping(value = "/loyalty/order/shipFail", method = RequestMethod.POST)
    public ResponseEntity<?> shipFail(@RequestBody OrderLoyalty order) {
        try {
            orderService.shipFailOrder(order);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(order.getId());
    }

    @RequestMapping(value = "/loyalty/order/close", method = RequestMethod.POST)
    public ResponseEntity<?> close(@RequestBody OrderLoyalty order) {
        try {
            orderService.closeOrder(order);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(order.getId());
    }
}

