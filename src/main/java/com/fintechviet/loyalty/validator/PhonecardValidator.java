package com.fintechviet.content.validator;

import com.fintechviet.ads.model.AppAd;
import com.fintechviet.content.model.Game;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class GameValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Game.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Game game = (Game) o;

        //For Name
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "gameForm.name.empty");
        if (game.getName().length()  > 100) {
            errors.rejectValue("name", "gameForm.name.size");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "link", "gameForm.link.empty");
        if (game.getLink().length()  > 255) {
            errors.rejectValue("link", "gameForm.link.size");
        }

        if (game.getId() == null) {
            if (StringUtils.isEmpty(game.getImageFile().getOriginalFilename())) {
                errors.rejectValue("imageFile", "gameForm.imageFile.empty");
            }
        }
    }
}
