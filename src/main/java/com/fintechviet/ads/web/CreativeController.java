package com.fintechviet.ads.web;

import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.service.CreativeService;
import com.fintechviet.ads.validator.CreativeImageValidator;
import com.fintechviet.ads.validator.CreativeVideoValidator;
import org.springframework.beans.factory.annotation.Autowired;
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
public class CreativeController {
    @Autowired
    private CreativeService creativeService;

    @Autowired
    private CreativeImageValidator creativeImageValidator;

    @Autowired
    private CreativeVideoValidator creativeVideoValidator;

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
    public String creativeVideo(@ModelAttribute("creativeForm") Creative creativeForm, BindingResult bindingResult) {
        creativeVideoValidator.validate(creativeForm, bindingResult);
        if (bindingResult.hasErrors()) {
            return "creativeVideo";
        }
        
        if (creativeForm.getId() == null) {
        	creativeForm.setStatus("NEW");
        }

        creativeForm.setTemplate("video");
        creativeService.save(creativeForm);
 
        return "redirect:/creativeVideo";
    }

    @RequestMapping(value = "/creativeImage", method = RequestMethod.POST)
    public String creativeImage(@ModelAttribute("creativeForm") Creative creativeForm, BindingResult bindingResult) throws IOException{
        creativeImageValidator.validate(creativeForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "creativeImage";
        }
        creativeForm.setTemplate("image");
        MultipartFile file = creativeForm.getImageFile();
        if (!file.getOriginalFilename().isEmpty()) {
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File("E:/abc", file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            creativeForm.setImageLink("/abc/" + file.getOriginalFilename());
        }
        
        if (creativeForm.getId() == null) {
        	creativeForm.setStatus("NEW");
        }

        creativeService.save(creativeForm);

        return "redirect:/creativeImage";
    }

}
