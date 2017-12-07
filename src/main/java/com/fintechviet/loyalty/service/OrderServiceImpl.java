package com.fintechviet.loyalty.service;

import com.fintechviet.loyalty.model.OrderLoyalty;
import com.fintechviet.loyalty.respository.OrderRespository;
import org.activiti.engine.ProcessEngine;
import org.activiti.engine.ProcessEngines;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    private OrderRespository orderRespository;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;

    @Override
    public OrderLoyalty getOrderById(Long id) {
        return orderRespository.findOne(id);
    }

    @Override
    public List<OrderLoyalty> getOrders(Date from, Date to) {
        List<OrderLoyalty> orders = orderRespository.getOrders(from, to);
        return orders;
    }

    @Override
    public void updateStatus(Long id, String status) {
        orderRespository.updateStatus(status, id);
    }

    @Override
    public void updateVoucherQuantity(Long orderId) {
        OrderLoyalty orderLoyalty = orderRespository.findOne(orderId);
        if (orderLoyalty.getVoucher() != null) {
            orderRespository.updateVoucherQuantity(orderLoyalty.getQuantity(), orderLoyalty.getVoucher().getId());
        }
    }

    @Override
    public void processOrder(OrderLoyalty orderLoyalty) {
        Map<String, Object> vars = Collections.<String, Object>singletonMap("id", orderLoyalty.getId());
        ProcessInstance processInstance = runtimeService.startProcessInstanceByKey("OrderProcess", vars);
        orderRespository.updateProcessInstanceId(processInstance.getId(), orderLoyalty.getId());
        orderRespository.updateStatus("PROCESSING", orderLoyalty.getId());
    }

    @Override
    public void cancelOrder(String processInstanceId) {
        Task task = taskService.createTaskQuery()
                               .processInstanceId(processInstanceId).singleResult();
        Map<String, Object> taskVariables = new HashMap<>();
        taskVariables.put("cancelOrder", true);
        ProcessEngine processEngine = ProcessEngines
                .getDefaultProcessEngine();
        processEngine.getTaskService().complete(task.getId(), taskVariables);

    }

    @Override
    public void closeOrder(OrderLoyalty orderLoyalty) {
        Task task = taskService.createTaskQuery()
                .processInstanceId(orderLoyalty.getProcessInstanceId()).singleResult();
        ProcessEngine processEngine = ProcessEngines
                .getDefaultProcessEngine();
        processEngine.getTaskService().complete(task.getId());
        updateStatus(orderLoyalty.getId(), "CLOSE");
    }

    @Override
    public void approveOrder(OrderLoyalty orderLoyalty) {
        Task task = taskService.createTaskQuery()
                .processInstanceId(orderLoyalty.getProcessInstanceId()).singleResult();
        OrderLoyalty order = orderRespository.findOne(orderLoyalty.getId());
        Map<String, Object> taskVariables = new HashMap<>();
        taskVariables.put("cancelOrder", false);
        if ((order.getVoucher() != null && order.getVoucher().getType().equals("E_VOUCHER")) || order.getPhoneCard() != null) {
            taskVariables.put("eVoucher", true);
        } else {
            updateStatus(orderLoyalty.getId(), "APPROVED");
            taskVariables.put("eVoucher", false);
        }
        ProcessEngine processEngine = ProcessEngines
                .getDefaultProcessEngine();
        processEngine.getTaskService().complete(task.getId(), taskVariables);
    }

    @Override
    public void shipSuccessOrder(OrderLoyalty orderLoyalty) {
        Task task = taskService.createTaskQuery()
                .processInstanceId(orderLoyalty.getProcessInstanceId()).singleResult();
        Map<String, Object> taskVariables = new HashMap<>();
        taskVariables.put("shipFail", false);
        ProcessEngine processEngine = ProcessEngines
                .getDefaultProcessEngine();
        processEngine.getTaskService().complete(task.getId(), taskVariables);
    }

    @Override
    public void shipFailOrder(OrderLoyalty orderLoyalty) {
        Task task = taskService.createTaskQuery()
                .processInstanceId(orderLoyalty.getProcessInstanceId()).singleResult();
        Map<String, Object> taskVariables = new HashMap<>();
        taskVariables.put("shipFail", true);
        ProcessEngine processEngine = ProcessEngines
                .getDefaultProcessEngine();
        processEngine.getTaskService().complete(task.getId(), taskVariables);
    }
}

