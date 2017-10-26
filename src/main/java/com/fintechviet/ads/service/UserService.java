package com.fintechviet.ads.service;

import com.fintechviet.ads.dto.UserDTO;
import com.fintechviet.ads.model.User;

import java.util.List;

public interface UserService {
    void save(User user);

    User findByUsername(String username);

    List<User> getAllUsers();

    void updatePassword(User user, String newPassword);

    void updateAvatar(User user, String newAvatarLink);

    List<UserDTO> getAllAdmins(String username);

    void updateRole(String username, String roleName);

    void updateStatus(String username, String status);

    void createPasswordResetTokenForUser(final User user, final String token);

    boolean isValidatePasswordResetToken(long id, String token);
}
