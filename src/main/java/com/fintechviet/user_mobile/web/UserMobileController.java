package com.fintechviet.user_mobile.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by tungn on 9/18/2017.
 */
@Controller
public class UserMobileController {
    @RequestMapping(value = "/user/userInfo", method = RequestMethod.GET)
    public String userInfo() {
        return "user_info";
    }

    @RequestMapping(value = "/user/userInvite", method = RequestMethod.GET)
    public String userInvite() {
        return "user_invite";
    }
}
