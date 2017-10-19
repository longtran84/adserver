package com.fintechviet.system.web;

import com.fintechviet.system.model.SystemParameter;
import com.fintechviet.system.service.SystemParameterService;
import com.fintechviet.system.validator.SystemParameterValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 * Created by tungn on 9/12/2017.
 */
@Controller
public class SystemParameterController {
    @Autowired
    private SystemParameterService systemParameterService;
    @Autowired
    private SystemParameterValidator systemParameterValidator;

    @RequestMapping(value = "/system/systemParameter", method = RequestMethod.GET)
    public String game(Model model) {
        SystemParameter systemParameter = systemParameterService.getById(1);
        model.addAttribute("systemParameterForm", systemParameter);

        return "system_parameter";
    }

    @RequestMapping(value = "/system/systemParameter", method = RequestMethod.POST)
    public String game(@ModelAttribute("systemParameterForm") SystemParameter systemParameterForm, BindingResult bindingResult, HttpServletRequest request) throws IOException {
        systemParameterValidator.validate(systemParameterForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "system_parameter";
        }

        systemParameterService.save(systemParameterForm);

        return "redirect:/system/systemParameter";
    }
}
