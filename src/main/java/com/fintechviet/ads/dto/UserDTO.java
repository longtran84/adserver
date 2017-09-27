package com.fintechviet.ads.dto;

import com.fintechviet.ads.model.Role;

import java.util.Date;

/**
 * Created by tungn on 9/26/2017.
 */
public class UserDTO {
    private String username;
    private String status = "ACTIVE";
    private Date createdDate;
    private Role role;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
