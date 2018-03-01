package com.fintechviet.user_mobile.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fintechviet.content.model.NewsCategory;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by tungn on 9/21/2017.
 */
@Entity
@Table(name = "user_mobile")
public class UserMobile {
    private long id;
    private String username;
    private String gender;
    private int dob;
    private String location;
    private long earning;
    private String inviteCode;
    private String inviteCodeUsed;
    private String status = "ACTIVE";
    private Timestamp createdDate;
    private int isRewardForUserInvite;
    private int noInvited;
    @JsonIgnoreProperties("userMobiles")
    private Set<NewsCategory> newsCategories;
    private Set<UserMobileDeviceToken> userMobileDeviceTokens;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "gender")
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "dob")
    public int getDob() {
        return dob;
    }

    public void setDob(int dob) {
        this.dob = dob;
    }

    @Basic
    @Column(name = "location")
    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @Basic
    @Column(name = "earning")
    public long getEarning() {
        return earning;
    }

    public void setEarning(long earning) {
        this.earning = earning;
    }

    @Basic
    @Column(name = "inviteCode")
    public String getInviteCode() {
        return inviteCode;
    }

    public void setInviteCode(String inviteCode) {
        this.inviteCode = inviteCode;
    }

    @Basic
    @Column(name = "inviteCodeUsed")
    public String getInviteCodeUsed() {
        return inviteCodeUsed;
    }

    public void setInviteCodeUsed(String inviteCodeUsed) {
        this.inviteCodeUsed = inviteCodeUsed;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Basic
    @Column(name = "createdDate", columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @ManyToMany
    @JoinTable(name = "user_mobile_interest", joinColumns = @JoinColumn(name = "uid"), inverseJoinColumns = @JoinColumn(name = "newsCategoryId"))
    public Set<NewsCategory> getNewsCategories() {
        return newsCategories;
    }

    public void setNewsCategories(Set<NewsCategory> newsCategories) {
        this.newsCategories = newsCategories;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "userMobile", cascade = CascadeType.ALL)
    public Set<UserMobileDeviceToken> getUserMobileDeviceToken() {
        return userMobileDeviceTokens;
    }

    public void setUserMobileDeviceToken(Set<UserMobileDeviceToken> userMobileDeviceTokens) {
        this.userMobileDeviceTokens = userMobileDeviceTokens;
    }

    @Basic
    @Column(name = "isRewardForUserInvite")
    public int getIsRewardForUserInvite() {
        return isRewardForUserInvite;
    }

    public void setIsRewardForUserInvite(int isRewardForUserInvite) {
        this.isRewardForUserInvite = isRewardForUserInvite;
    }

    @Basic
    @Column(name = "noInvited")
    public int getNoInvited() {
        return noInvited;
    }

    public void setNoInvited(int noInvited) {
        this.noInvited = noInvited;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserMobile that = (UserMobile) o;

        if (id != that.id) return false;
        if (earning != that.earning) return false;
        if (username != null ? !username.equals(that.username) : that.username != null) return false;
        if (gender != null ? !gender.equals(that.gender) : that.gender != null) return false;
        if (location != null ? !location.equals(that.location) : that.location != null) return false;
        if (inviteCode != null ? !inviteCode.equals(that.inviteCode) : that.inviteCode != null) return false;
        if (inviteCodeUsed != null ? !inviteCodeUsed.equals(that.inviteCodeUsed) : that.inviteCodeUsed != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (createdDate != null ? !createdDate.equals(that.createdDate) : that.createdDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (int) (earning ^ (earning >>> 32));
        result = 31 * result + (inviteCode != null ? inviteCode.hashCode() : 0);
        result = 31 * result + (inviteCodeUsed != null ? inviteCodeUsed.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        return result;
    }
}
