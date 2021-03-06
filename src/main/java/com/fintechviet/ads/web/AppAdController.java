package com.fintechviet.ads.web;

import com.fintechviet.ads.model.AppAd;
import com.fintechviet.ads.service.AppAdService;
import com.fintechviet.ads.validator.AppAdValidator;
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

@Controller
public class AppAdController {
    @Autowired
    private AppAdService appAdService;

    @Autowired
    private SystemParameterService systemParameterService;

    @Autowired
    private AppAdValidator appAdValidator;

    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/appAd", method = RequestMethod.GET)
    public String appAd(Model model) {
        model.addAttribute("appAdForm", new AppAd());

        return "appAd";
    }

    @RequestMapping(value = "/appAd", method = RequestMethod.POST)
    public String appAd(@ModelAttribute("appAdForm") AppAd appAdForm, BindingResult bindingResult) throws IOException {
        appAdValidator.validate(appAdForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "appAd";
        }

        MultipartFile file = appAdForm.getIconFile();
        if (!file.getOriginalFilename().isEmpty()) {
            SystemParameter systemParameter = systemParameterService.getById(1);
            File folderStore = resourceLoader.getResource(systemParameter.getAppIconFolder()).getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            appAdForm.setIcon(systemParameter.getAppIconPath() + file.getOriginalFilename());
        }

        AppAd appAd = null;
        if (appAdForm.getId() != null) {
            appAd = appAdService.findById(appAdForm.getId());
            appAd.setCampaign(appAdForm.getCampaign());
            appAd.setName(appAdForm.getName());
            appAd.setShortDescription(appAdForm.getShortDescription());
            if (StringUtils.isNotEmpty(appAdForm.getIcon()))
                appAd.setIcon(appAdForm.getIcon());
            appAd.setInstallLink(appAdForm.getInstallLink());
            appAdService.save(appAd);
        } else {
            appAdService.save(appAdForm);
        }
 
        return "redirect:/appAd";
    }

    @RequestMapping(value = "/reportApp", method = RequestMethod.GET)
    public String reportApp() {
        return "report_app";
    }
}
