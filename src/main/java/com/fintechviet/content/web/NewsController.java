package com.fintechviet.content.web;

import com.fintechviet.content.model.News;
import com.fintechviet.content.service.NewsService;
import com.fintechviet.content.validator.NewsValidator;
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
 * Created by tungn on 9/18/2017.
 */
@Controller
public class NewsController {

    @Autowired
    private NewsService newsService;

    @Autowired
    private SystemParameterService systemParameterService;

    @Autowired
    private NewsValidator newsValidator;

    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/content/news", method = RequestMethod.GET)
    public String news(Model model) {
        model.addAttribute("newsForm", new News());
        return "news";
    }

    @RequestMapping(value = "/content/news", method = RequestMethod.POST)
    public String news(@ModelAttribute("newsForm") News newsForm, BindingResult bindingResult) throws IOException {
        newsValidator.validate(newsForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "news";
        }

        MultipartFile file = newsForm.getImageFile();
        if (!file.getOriginalFilename().isEmpty()) {
            SystemParameter systemParameter = systemParameterService.getById(1);
            File folderStore = resourceLoader.getResource(systemParameter.getNewsImageFolder()).getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            newsForm.setImageLink(systemParameter.getNewsImagePath() + file.getOriginalFilename());
        }

        News news;
        if (newsForm.getId() != null) {
            news = newsService.findById(newsForm.getId());
            news.setNewsCategory(newsForm.getNewsCategory());
            news.setTitle(newsForm.getTitle());
            news.setShortDescription(newsForm.getShortDescription());
            news.setContent(newsForm.getContent());
            if (StringUtils.isNotEmpty(newsForm.getImageLink()))
                news.setImageLink(newsForm.getImageLink());
            news.setSource(newsForm.getSource());
            newsService.save(news);
        } else {
            newsService.save(newsForm);
        }

        return "redirect:/content/news";
    }

}
