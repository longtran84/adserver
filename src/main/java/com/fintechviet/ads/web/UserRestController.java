package com.fintechviet.ads.web;

import com.fintechviet.ads.dto.UserDTO;
import com.fintechviet.ads.model.Advertiser;
import com.fintechviet.ads.model.User;
import com.fintechviet.ads.request.UpdateRoleRequest;
import com.fintechviet.ads.service.UserService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by tungn on 8/21/2017.
 */
@RestController
public class UserRestController {
    @Autowired
    private UserService userService;

    private static final Gson gson = new Gson();

    @RequestMapping(path = "/users", method = RequestMethod.GET)
    public List<User> getAllUsers(){
        return userService.getAllUsers();
    }

    @RequestMapping(value = "/system/admins", method = RequestMethod.GET)
    public List<UserDTO> getAllAdmins(){
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return userService.getAllAdmins(auth.getName());
    }

    @RequestMapping(value = "/system/updateUserRole", method = RequestMethod.POST)
    public ResponseEntity<?> updateUserRole(@RequestBody UpdateRoleRequest request) {
        try {
            userService.updateRole(request.getUsername(), request.getRole());
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(gson.toJson("ok"));
    }

    @RequestMapping(value = "/system/activateUser", method = RequestMethod.POST)
    public ResponseEntity<?> activateUser(@RequestBody User user) {
        try {
            String status = user.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            userService.updateStatus(user.getUsername(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(gson.toJson(user.getUsername()));
    }
}
