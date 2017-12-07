package com.fintechviet.loyalty.service;

import org.activiti.engine.TaskService;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CancelOrderDelegate implements JavaDelegate {

	@Autowired
	private OrderService orderService;

	@Autowired
	private TaskService taskService;

	public void execute(DelegateExecution execution) {
		Long id = (Long) execution.getVariable("id");
		orderService.updateStatus(id, "CANCELLED");
		taskService.complete(execution.getCurrentActivityId());
	}
}
