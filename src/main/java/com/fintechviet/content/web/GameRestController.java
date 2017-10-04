package com.fintechviet.content.web;

import com.fintechviet.content.model.Game;
import com.fintechviet.content.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tungn on 9/12/2017.
 */
@RestController
public class GameRestController {
    @Autowired
    private GameService gameService;

    @RequestMapping(value = "/games", method = RequestMethod.GET)
    public List<Game> games(){
        return gameService.getGames();
    }


    @RequestMapping(value = "/deleteGame", method = RequestMethod.POST)
    public ResponseEntity<?> deleteGame(@RequestBody Game game) {
        try {
            gameService.delete(game);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(game);
    }
    
    @RequestMapping(value = "/activateGame", method = RequestMethod.POST)
    public ResponseEntity<?> activateGame(@RequestBody Game game) {
        try {
            String status = game.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            gameService.updateStatus(game.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(game.getId());
    }
    
}

