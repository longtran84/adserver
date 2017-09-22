package com.fintechviet.user_mobile.dto;

import java.util.Date;

/**
 * Created by tungn on 9/21/2017.
 */
public class UserInfoDTO {
    private long id;
    private String username;
    private String gender;
    private int dob;
    private String location;
    private long earning;
    private String inviteCodeUsed;
    private String status;
    private Date createdDate;
    private String interests;
    private int devices;
    private String userInvite;

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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getDob() {
        return dob;
    }

    public void setDob(int dob) {
        this.dob = dob;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public long getEarning() {
        return earning;
    }

    public void setEarning(long earning) {
        this.earning = earning;
    }

    public String getInviteCodeUsed() {
        return inviteCodeUsed;
    }

    public void setInviteCodeUsed(String inviteCodeUsed) {
        this.inviteCodeUsed = inviteCodeUsed;
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

    public String getInterests() {
        return interests;
    }

    public void setInterests(String interests) {
        this.interests = interests;
    }

    public int getDevices() {
        return devices;
    }

    public void setDevices(int devices) {
        this.devices = devices;
    }

    public String getUserInvite() {
        return userInvite;
    }

    public void setUserInvite(String userInvite) {
        this.userInvite = userInvite;
    }
}
