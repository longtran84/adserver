package com.fintechviet.content.web;

import com.fintechviet.content.model.Content;
import com.fintechviet.content.model.ContentDetails;
import com.fintechviet.content.service.ContentDetailsService;
import com.fintechviet.content.service.ContentService;
import com.fintechviet.content.validator.ContentDetailValidator;
import com.fintechviet.system.model.SystemParameter;
import com.fintechviet.system.service.SystemParameterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
public class ContentDetailsController {
    @Autowired
    private ContentDetailsService contentDetailsService;

    @Autowired
    private SystemParameterService systemParameterService;

    @Autowired
    private ContentService contentService;

    @Autowired
    private ContentDetailValidator contentDetailValidator;

    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/contentDetail", method = RequestMethod.GET)
    public String content(@RequestParam("contentId") long contentId, Model model) {
        Content content = contentService.findById(contentId);
        ContentDetails contentDetails = new ContentDetails();
        model.addAttribute("contentDetailForm", contentDetails);
        contentDetails.setContId(contentId);
        model.addAttribute("content", content);

        return "content_details";
    }

    @RequestMapping(value = "/contentDetail", method = RequestMethod.POST)
    public String content(@ModelAttribute("contentDetailForm") ContentDetails contentDetailForm, Model model, BindingResult bindingResult) throws IOException {
        contentDetailValidator.validate(contentDetailForm, bindingResult);

        Content content = contentService.findById(contentDetailForm.getContId());
        model.addAttribute("content", content);

        if (bindingResult.hasErrors()) {
            return "content_details";
        }

        MultipartFile file = contentDetailForm.getImageFile();
        if (!file.getOriginalFilename().isEmpty()) {
            SystemParameter systemParameter = systemParameterService.getById(1);
            File folderStore = resourceLoader.getResource(systemParameter.getContentImageFolder()).getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            contentDetailForm.setImageLink(systemParameter.getContentImagePath() + file.getOriginalFilename());
        }


        contentDetailsService.save(contentDetailForm);

        return "redirect:/contentDetail?contentId=" + contentDetailForm.getContId();
    }

}
