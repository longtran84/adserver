package com.fintechviet.content.web;

import com.fintechviet.content.model.InAppMessage;
import com.fintechviet.content.service.InAppMessageService;
import com.fintechviet.content.validator.InAppMessageValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class InAppMessageController {
    @Autowired
    private InAppMessageService inAppMessageService;

    @Autowired
    private InAppMessageValidator inAppMessageValidator;

    @RequestMapping(value = "/content/inAppMessage", method = RequestMethod.GET)
    public String content(Model model) {
        model.addAttribute("inAppMessageForm", new InAppMessage());

        return "in_app_message";
    }

    @RequestMapping(value = "/content/inAppMessage", method = RequestMethod.POST)
    public String content(@ModelAttribute("inAppMessageForm") InAppMessage inAppMessageForm, BindingResult bindingResult) {
        inAppMessageValidator.validate(inAppMessageForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "in_app_message";
        }

        inAppMessageService.save(inAppMessageForm);

        return "redirect:/content/inAppMessage";
    }

}
