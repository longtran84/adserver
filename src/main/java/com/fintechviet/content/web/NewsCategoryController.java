package com.fintechviet.content.web;

import com.fintechviet.ads.model.Ad;
import com.fintechviet.content.model.NewsCategory;
import com.fintechviet.content.service.NewsCategoryService;
import com.fintechviet.content.validator.NewsCategoryValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
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

/**
 * Created by tungn on 9/12/2017.
 */
@Controller
public class NewsCategoryController {
    @Autowired
    private NewsCategoryService newsCategoryService;
    @Autowired
    private NewsCategoryValidator newsCategoryValidator;
    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/reportUserInterest", method = RequestMethod.GET)
    public String reportInventory() {
        return "report_user_interest";
    }

    @RequestMapping(value = "/news/category", method = RequestMethod.GET)
    public String campaign(Model model) {
        model.addAttribute("categoryForm", new NewsCategory());

        return "news_category";
    }

    @RequestMapping(value = "/news/category", method = RequestMethod.POST)
    public String campaign(@ModelAttribute("categoryForm") NewsCategory categoryForm, BindingResult bindingResult, HttpServletRequest request) throws IOException {
        newsCategoryValidator.validate(categoryForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "news_category";
        }

        MultipartFile file = categoryForm.getImageFile();
        if (!file.getOriginalFilename().isEmpty()) {
            File folderStore = resourceLoader.getResource("images").getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            String serverName = request.getServerName();
            int serverPort = request.getServerPort();
            categoryForm.setImage(serverName + ":" + serverPort + "/images/" + file.getOriginalFilename());
        }

        newsCategoryService.save(categoryForm);

        return "redirect:/news/category";
    }
}
