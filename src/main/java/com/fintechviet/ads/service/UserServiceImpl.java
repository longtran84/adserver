package com.fintechviet.ads.service;

import com.fintechviet.ads.dto.UserDTO;
import com.fintechviet.ads.model.PasswordResetToken;
import com.fintechviet.ads.model.Role;
import com.fintechviet.ads.model.User;
import com.fintechviet.ads.repository.PasswordResetTokenRepository;
import com.fintechviet.ads.repository.RoleRepository;
import com.fintechviet.ads.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private Md5PasswordEncoder md5PasswordEncoder;
    @Autowired
    private PasswordResetTokenRepository passwordTokenRepository;

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

    @Override
    public void updatePassword(User user, String newPassword) {
        user.setPassword(md5PasswordEncoder.encodePassword(newPassword, null));
        userRepository.save(user);
    }

    @Override
    public void updateAvatar(User user, String newAvatarLink) {
        user.setAvatarLink(newAvatarLink);
        userRepository.save(user);
    }

    @Override
    public List<UserDTO> getAllAdmins(String username) {
        List<UserDTO> userDTOS = new ArrayList<UserDTO>();
        List<User> users = userRepository.findAdmins(username);
        for (User user : users) {
            UserDTO userDTO = new UserDTO();
            userDTO.setUsername(user.getUsername());
            userDTO.setCreatedDate(user.getCreatedDate());
            userDTO.setStatus(user.getStatus());
            for (Role role : user.getRoles()) {
                userDTO.setRole(role);
            }
            userDTOS.add(userDTO);
        }
        return userDTOS;
    }

    @Override
    public void updateRole(String username, String roleName) {
        User user = userRepository.findByUsername(username);
        Role role = roleRepository.findByName(roleName);
        user.setRoles(new HashSet<Role>() {
            {
                add(role);
            }
        });
        userRepository.save(user);
    }

    @Override
    public void updateStatus(String username, String status) {
        User user = userRepository.findByUsername(username);
        user.setStatus(status);
        userRepository.save(user);
    }

    @Override
    public void createPasswordResetTokenForUser(final User user, final String token) {
        final PasswordResetToken myToken = new PasswordResetToken(token, user);
        passwordTokenRepository.save(myToken);
    }

    @Override
    public boolean isValidatePasswordResetToken(long id, String token) {
        final PasswordResetToken passToken = passwordTokenRepository.findByToken(token);
        if ((passToken == null) || (passToken.getUser()
                .getId() != id)) {
            return false;
        }

        final Calendar cal = Calendar.getInstance();
        if ((passToken.getExpiryDate()
                .getTime() - cal.getTime()
                .getTime()) <= 0) {
            return false;
        }

        User user = passToken.getUser();
        Authentication auth = new UsernamePasswordAuthenticationToken(
                user, null, Arrays.asList(
                new SimpleGrantedAuthority("CHANGE_PASSWORD_PRIVILEGE")));
        SecurityContextHolder.getContext().setAuthentication(auth);
        return true;
    }
}
