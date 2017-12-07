package com.fintechviet.content.service;

import com.fintechviet.content.model.Game;
import com.fintechviet.content.repository.GameRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GameServiceImpl implements GameService {
    @Autowired
    private GameRepository gameRepository;

    @Override
    public void save(Game game) {
        gameRepository.save(game);
    }

    @Override
    public void delete(Game game) {
        gameRepository.delete(game);
    }

    @Override
    public List<Game> getGames() {
        return gameRepository.findAll();
    }

    @Override
    public void updateStatus(Integer id, String status) {
        gameRepository.updateStatus(status, id);
    }
}
