package com.fintechviet.user_mobile.dto;

import java.util.Date;

/**
 * Created by tungn on 9/21/2017.
 */
public class UserInviteDTO {
    private long id;
    private String username;
    private long earning;
    private String status;
    private Date createdDate;
    private long idInvite;
    private String usernameInvite;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public long getEarning() {
        return earning;
    }

    public void setEarning(long earning) {
        this.earning = earning;
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

    public long getIdInvite() {
        return idInvite;
    }

    public void setIdInvite(long idInvite) {
        this.idInvite = idInvite;
    }

    public String getUsernameInvite() {
        return usernameInvite;
    }

    public void setUsernameInvite(String usernameInvite) {
        this.usernameInvite = usernameInvite;
    }
}
