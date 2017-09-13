package com.fintechviet.content.dto;

/**
 * Created by tungn on 9/12/2017.
 */
public class UserInterestDTO {
    private String newsCategoryName;
    private Integer noOfUsers;

    public String getNewsCategoryName() {
        return newsCategoryName;
    }

    public void setNewsCategoryName(String newsCategoryName) {
        this.newsCategoryName = newsCategoryName;
    }

    public Integer getNoOfUsers() {
        return noOfUsers;
    }

    public void setNoOfUsers(Integer noOfUsers) {
        this.noOfUsers = noOfUsers;
    }
}
