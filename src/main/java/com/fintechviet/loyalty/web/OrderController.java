package com.fintechviet.loyalty.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by tungn on 9/18/2017.
 */
@Controller
public class OrderController {
    @RequestMapping(value = "/loyalty/order", method = RequestMethod.GET)
    public String order() {
        return "order";
    }
}
