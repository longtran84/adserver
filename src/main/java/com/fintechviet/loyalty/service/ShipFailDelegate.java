package com.fintechviet.loyalty.service;

import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ShipFailDelegate implements JavaDelegate {

	@Autowired
	private OrderService orderService;

	public void execute(DelegateExecution execution) {
		Long id = (Long) execution.getVariable("id");
		orderService.updateStatus(id, "FAIL");
	}
}
