package com.fintechviet.content.validator;

import com.fintechviet.ads.model.Campaign;
import com.fintechviet.ads.model.Creative;
import com.fintechviet.ads.service.CampaignService;
import com.fintechviet.content.model.News;
import com.fintechviet.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class NewsValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return News.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        News news = (News) o;

        if (news.getNewsCategory().getId() == null) {
            errors.rejectValue("newsCategory.id", "newsForm.newsCategory.empty");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "newsForm.title.empty");
        if (news.getTitle().length()  > 255) {
            errors.rejectValue("title", "newsForm.title.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shortDescription", "newsForm.shortDescription.empty");
        if (news.getShortDescription().length()  > 500) {
            errors.rejectValue("shortDescription", "newsForm.shortDescription.size");
        }

        if (news.getId() == null) {
            if (StringUtils.isEmpty(news.getImageFile().getOriginalFilename())) {
                errors.rejectValue("imageFile", "newsForm.imageFile.empty");
            }
        }
    }
    
}
