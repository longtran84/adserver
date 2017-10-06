package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.service.CreativeService;
import com.fintechviet.ads.validator.CreativeImageValidator;
import com.fintechviet.ads.validator.CreativeVideoValidator;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
public class CreativeController {
    @Autowired
    private CreativeService creativeService;

    @Autowired
    private CreativeImageValidator creativeImageValidator;

    @Autowired
    private CreativeVideoValidator creativeVideoValidator;

    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/creativeImage", method = RequestMethod.GET)
    public String creativeImage(Model model) {
        model.addAttribute("creativeForm", new Creative());

        return "creativeImage";
    }

    @RequestMapping(value = "/creativeVideo", method = RequestMethod.GET)
    public String creativeVideo(Model model) {
        model.addAttribute("creativeForm", new Creative());

        return "creativeVideo";
    }

    @RequestMapping(value = "/creativeVideo", method = RequestMethod.POST)
    public String creativeVideo(@ModelAttribute("creativeForm") Creative creativeForm, BindingResult bindingResult, HttpServletRequest request) throws IOException {
        creativeVideoValidator.validate(creativeForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "creativeVideo";
        }
        
        if (creativeForm.getId() == null) {
        	creativeForm.setStatus("NEW");
        }

        creativeForm.setTemplate("video");
        MultipartFile file = creativeForm.getVideoFile();
        if (!file.getOriginalFilename().isEmpty()) {
            File folderStore = resourceLoader.getResource("ad/videos").getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            String serverName = request.getServerName();
            int serverPort = request.getServerPort();
            creativeForm.setVideoLink("http://" + serverName + ":" + serverPort + "/ad/videos/" + file.getOriginalFilename());
        }

        Creative creative = null;
        if (creativeForm.getId() != null) {
            creative = creativeService.findById(creativeForm.getId());
            creative.setAdvertiser(creativeForm.getAdvertiser());
            creative.setTitle(creativeForm.getTitle());
            creative.setBody(creativeForm.getBody());
            creative.setAlt(creativeForm.getAlt());
            if (StringUtils.isNotEmpty(creativeForm.getVideoLink()))
                creative.setVideoLink(creativeForm.getVideoLink());
            creativeService.save(creative);
        } else {
            creativeService.save(creativeForm);
        }
 
        return "redirect:/creativeVideo";
    }

    @RequestMapping(value = "/creativeImage", method = RequestMethod.POST)
    public String creativeImage(@ModelAttribute("creativeForm") Creative creativeForm, BindingResult bindingResult, HttpServletRequest request) throws IOException {
        creativeImageValidator.validate(creativeForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "creativeImage";
        }

        creativeForm.setTemplate("image");
        MultipartFile file = creativeForm.getImageFile();
        if (!file.getOriginalFilename().isEmpty()) {
            File folderStore = resourceLoader.getResource("ad/images").getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            String serverName = request.getServerName();
            int serverPort = request.getServerPort();
            creativeForm.setImageLink("http://" + serverName + ":" + serverPort + "/ad/images/" + file.getOriginalFilename());
        }

        if (creativeForm.getId() == null) {
            creativeForm.setStatus("NEW");
        }

        Creative creative = null;
        if (creativeForm.getId() != null) {
            creative = creativeService.findById(creativeForm.getId());
            creative.setAdvertiser(creativeForm.getAdvertiser());
            creative.setTitle(creativeForm.getTitle());
            creative.setBody(creativeForm.getBody());
            creative.setAlt(creativeForm.getAlt());
            creative.setAdType(creativeForm.getAdType());
            if (StringUtils.isNotEmpty(creativeForm.getImageLink()))
                creative.setImageLink(creativeForm.getImageLink());
            creativeService.save(creative);
        } else {
            creativeService.save(creativeForm);
        }

        return "redirect:/creativeImage";
    }

}
