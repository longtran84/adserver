package com.fintechviet.content.web;

import com.fintechviet.content.model.Game;
import com.fintechviet.content.service.GameService;
import com.fintechviet.content.validator.GameValidator;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * Created by tungn on 9/12/2017.
 */
@Controller
public class GameController {
    @Autowired
    private GameService gameService;
    @Autowired
    private SystemParameterService systemParameterService;
    @Autowired
    private GameValidator gameValidator;
    @Autowired
    private ResourceLoader resourceLoader;

    @RequestMapping(value = "/game", method = RequestMethod.GET)
    public String game(Model model) {
        model.addAttribute("gameForm", new Game());

        return "game";
    }

    @RequestMapping(value = "/game", method = RequestMethod.POST)
    public String game(@ModelAttribute("gameForm") Game gameForm, BindingResult bindingResult) throws IOException {
        gameValidator.validate(gameForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "game";
        }

        MultipartFile file = gameForm.getImageFile();
        if (!file.getOriginalFilename().isEmpty()) {
            File folderStore = resourceLoader.getResource("images").getFile();
            BufferedOutputStream outputStream = new BufferedOutputStream(
                    new FileOutputStream(
                            new File(folderStore.getAbsolutePath(), file.getOriginalFilename())));
            outputStream.write(file.getBytes());
            outputStream.flush();
            outputStream.close();
            SystemParameter systemParameter = systemParameterService.getById(1);
            gameForm.setImage(systemParameter.getGameImagePath() + file.getOriginalFilename());
        }

        gameService.save(gameForm);

        return "redirect:/game";
    }
}
