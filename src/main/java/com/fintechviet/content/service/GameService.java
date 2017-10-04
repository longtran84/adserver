package com.fintechviet.content.service;

import com.fintechviet.content.model.Game;

import java.util.List;

public interface GameService {
    void save(Game game);
    void delete(Game game);
    void updateStatus(Integer id, String status);
    List<Game> getGames();
}
