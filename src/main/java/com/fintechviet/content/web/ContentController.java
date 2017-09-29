package com.fintechviet.content.web;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.content.model.Content;
import com.fintechviet.content.service.ContentService;
import com.fintechviet.content.validator.ContentValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ContentController {
    @Autowired
    private ContentService contentService;

    @Autowired
    private ContentValidator contentValidator;

    @RequestMapping(value = "/content", method = RequestMethod.GET)
    public String content(Model model) {
        model.addAttribute("contentForm", new Content());

        return "content";
    }

    @RequestMapping(value = "/content", method = RequestMethod.POST)
    public String content(@ModelAttribute("contentForm") Content contentForm, BindingResult bindingResult) {
        contentValidator.validate(contentForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "content";
        }

        contentService.save(contentForm);

        return "redirect:/content";
    }

}
