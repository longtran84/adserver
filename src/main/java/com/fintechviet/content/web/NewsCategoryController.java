package com.fintechviet.content.web;

import com.fintechviet.content.model.NewsCategory;
import com.fintechviet.content.service.NewsCategoryService;
import com.fintechviet.content.validator.NewsCategoryValidator;
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
public class NewsCategoryController {
    @Autowired
    private NewsCategoryService newsCategoryService;
    @Autowired
    private SystemParameterService systemParameterService;
    @Autowired
    private NewsCategoryValidator newsCategoryValidator;
    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/reportUserInterest", method = RequestMethod.GET)
    public String reportInventory() {
        return "report_user_interest";
    }

    @RequestMapping(value = "/content/category", method = RequestMethod.GET)
    public String campaign(Model model) {
        model.addAttribute("categoryForm", new NewsCategory());

        return "news_category";
    }

    @RequestMapping(value = "/content/category", method = RequestMethod.POST)
    public String campaign(@ModelAttribute("categoryForm") NewsCategory categoryForm, BindingResult bindingResult) throws IOException {
        newsCategoryValidator.validate(categoryForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "news_category";
        }

        MultipartFile file = categoryForm.getImageFile();
        if (!file.getOriginalFilename().isEmpty()) {
            SystemParameter systemParameter = systemParameterService.getById(1);
            File folderStore = resourceLoader.getResource(systemParameter.getNewsCategoryFolder()).getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            categoryForm.setImage(systemParameter.getNewsCategoryPath() + file.getOriginalFilename());
        }

        NewsCategory newsCategory = null;
        if (categoryForm.getId() != null) {
            newsCategory = newsCategoryService.findById(categoryForm.getId());
            newsCategory.setCode(categoryForm.getCode());
            newsCategory.setName(categoryForm.getName());
            if (StringUtils.isNotEmpty(categoryForm.getImage()))
                newsCategory.setImage(categoryForm.getImage());
            newsCategoryService.save(newsCategory);
        } else {
            newsCategoryService.save(categoryForm);
        }

        return "redirect:/content/category";
    }
}
