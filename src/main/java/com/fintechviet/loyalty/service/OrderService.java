package com.fintechviet.loyalty.service;


import com.fintechviet.loyalty.model.OrderLoyalty;
import org.activiti.engine.delegate.DelegateExecution;

import java.util.Date;
import java.util.List;

public interface OrderService {
    OrderLoyalty getOrderById(Long id);
    List<OrderLoyalty> getOrders(Date from, Date to);
    void updateStatus(Long id, String status);
    void updateVoucherQuantity(Long orderId);
    void processOrder(OrderLoyalty orderLoyalty);
    void cancelOrder(String processInstanceId);
    void closeOrder(OrderLoyalty orderLoyalty);
    void approveOrder(OrderLoyalty orderLoyalty);
    void shipSuccessOrder(OrderLoyalty orderLoyalty);
    void shipFailOrder(OrderLoyalty orderLoyalty);
}
