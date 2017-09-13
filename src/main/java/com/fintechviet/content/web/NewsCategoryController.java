package com.fintechviet.content.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by tungn on 9/12/2017.
 */
@Controller
public class NewsCategoryController {
    @RequestMapping(value = "/reportUserInterest", method = RequestMethod.GET)
    public String reportInventory() {
        return "report_user_interest";
    }
}
