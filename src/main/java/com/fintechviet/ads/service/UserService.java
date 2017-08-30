package com.fintechviet.ads.service;

import com.fintechviet.ads.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    List<User> getAllUsers();
}
