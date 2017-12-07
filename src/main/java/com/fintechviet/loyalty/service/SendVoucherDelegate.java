package com.fintechviet.loyalty.service;

import com.fintechviet.loyalty.model.OrderLoyalty;
import org.activiti.engine.delegate.DelegateExecution;
import org.activiti.engine.delegate.JavaDelegate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class SendVoucherDelegate implements JavaDelegate {

	@Autowired
	private OrderService orderService;

	@Autowired
	private VoucherService voucherService;

	@Autowired
	private PhonecardService phonecardService;

	private static final Logger LOG = LoggerFactory.getLogger(SendVoucherDelegate.class);

	public void execute(DelegateExecution execution) {
		Long id = (Long) execution.getVariable("id");
		OrderLoyalty order = orderService.getOrderById(id);
		if (order.getVoucher() != null) {
			String code = voucherService.findVoucherCodeByVoucherId(order.getVoucher().getId());
			// Send voucher code
			LOG.info("Voucher code ----------------- " + code);
			execution.setVariable("sendFail", true);
		}

		if (order.getPhoneCard() != null) {
			String code = phonecardService.findPhoneCardCodeByPhoneCardId(order.getPhoneCard().getId());
			// Send phone card code
			LOG.info("Phone card code ----------------- " + code);
			execution.setVariable("sendFail", true);
		}
	}
}
