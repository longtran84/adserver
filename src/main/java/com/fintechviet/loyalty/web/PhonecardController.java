package com.fintechviet.loyalty.web;

import com.fintechviet.loyalty.model.Phonecard;
import com.fintechviet.loyalty.service.PhonecardService;
import com.fintechviet.loyalty.validator.PhonecardValidator;
import com.fintechviet.system.model.SystemParameter;
import com.fintechviet.system.service.SystemParameterService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by tungn on 9/12/2017.
 */
@Controller
public class PhonecardController {
    @Autowired
    private PhonecardService phonecardService;
    @Autowired
    private SystemParameterService systemParameterService;
    @Autowired
    private PhonecardValidator phonecardValidator;
    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/loyalty/phoneCard", method = RequestMethod.GET)
    public String phoneCard(Model model) {
        model.addAttribute("phoneCardForm", new Phonecard());

        return "phonecard";
    }

    @RequestMapping(value = "/loyalty/phoneCard", method = RequestMethod.POST)
    public String game(@ModelAttribute("phoneCardForm") Phonecard phoneCardForm, BindingResult bindingResult) throws IOException {
        phonecardValidator.validate(phoneCardForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "phonecard";
        }

        MultipartFile file = phoneCardForm.getImageFile();
        if (!file.getOriginalFilename().isEmpty()) {
            SystemParameter systemParameter = systemParameterService.getById(1);
            File folderStore = resourceLoader.getResource(systemParameter.getLoyaltyPhoneCardImageFolder()).getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            phoneCardForm.setImage(systemParameter.getLoyaltyPhoneCardImagePath() + file.getOriginalFilename());
        }

        Phonecard phonecard = null;
        if (phoneCardForm.getId() != null) {
            phonecard = phonecardService.findById(phoneCardForm.getId());
            phonecard.setName(phoneCardForm.getName());
            phonecard.setPrice(phoneCardForm.getPrice());
            phonecard.setLegacyId(phoneCardForm.getLegacyId());
            phonecard.setStatus(phoneCardForm.getStatus());
            if (StringUtils.isNotEmpty(phoneCardForm.getImage()))
                phonecard.setImage(phoneCardForm.getImage());
            phonecardService.save(phonecard);
        } else {
            phonecardService.save(phoneCardForm);
        }

        return "redirect:/loyalty/phoneCard";
    }
}
