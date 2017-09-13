package com.fintechviet.ads.service;

import com.fintechviet.ads.model.User;
import com.fintechviet.ads.repository.RoleRepository;
import com.fintechviet.ads.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private Md5PasswordEncoder md5PasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(md5PasswordEncoder.encodePassword(user.getPassword(), null));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}
