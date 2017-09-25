package com.fintechviet.content.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by tungn on 9/18/2017.
 */
@Controller
public class NewsController {
    @RequestMapping(value = "/news/page", method = RequestMethod.GET)
    public String news() {
        return "news";
    }
}
