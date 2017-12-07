package com.fintechviet.system.model;

import javax.persistence.*;

/**
 * Created by tungn on 10/16/2017.
 */
@Entity
@Table(name = "system_parameter", schema = "mobileads", catalog = "")
public class SystemParameter {
    private int id;
    private String advImagePath;
    private String advVideoPath;
    private String newsImagePath;
    private String contentImagePath;
    private String newsCategoryPath;
    private String appIconPath;
    private String gameImagePath;
    private String loyaltyPhoneCardImagePath;
    private String loyaltyVoucherImagePath;
    private String advImageFolder;
    private String advVideoFolder;
    private String newsImageFolder;
    private String contentImageFolder;
    private String newsCategoryFolder;
    private String appIconFolder;
    private String gameImageFolder;
    private String loyaltyPhoneCardImageFolder;
    private String loyaltyVoucherImageFolder;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "adv_image_path")
    public String getAdvImagePath() {
        return advImagePath;
    }

    public void setAdvImagePath(String advImagePath) {
        this.advImagePath = advImagePath;
    }

    @Basic
    @Column(name = "adv_video_path")
    public String getAdvVideoPath() {
        return advVideoPath;
    }

    public void setAdvVideoPath(String advVideoPath) {
        this.advVideoPath = advVideoPath;
    }

    @Basic
    @Column(name = "news_image_path")
    public String getNewsImagePath() {
        return newsImagePath;
    }

    public void setNewsImagePath(String newsImagePath) {
        this.newsImagePath = newsImagePath;
    }

    @Basic
    @Column(name = "content_image_path")
    public String getContentImagePath() {
        return contentImagePath;
    }

    public void setContentImagePath(String contentImagePath) {
        this.contentImagePath = contentImagePath;
    }

    @Basic
    @Column(name = "news_category_path")
    public String getNewsCategoryPath() {
        return newsCategoryPath;
    }

    public void setNewsCategoryPath(String newsCategoryPath) {
        this.newsCategoryPath = newsCategoryPath;
    }

    @Basic
    @Column(name = "app_icon_path")
    public String getAppIconPath() {
        return appIconPath;
    }

    public void setAppIconPath(String appIconPath) {
        this.appIconPath = appIconPath;
    }

    @Basic
    @Column(name = "game_image_path")
    public String getGameImagePath() {
        return gameImagePath;
    }

    public void setGameImagePath(String gameImagePath) {
        this.gameImagePath = gameImagePath;
    }

    @Basic
    @Column(name = "loyalty_phone_card_image_path")
    public String getLoyaltyPhoneCardImagePath() {
        return loyaltyPhoneCardImagePath;
    }

    public void setLoyaltyPhoneCardImagePath(String loyaltyPhoneCardImagePath) {
        this.loyaltyPhoneCardImagePath = loyaltyPhoneCardImagePath;
    }

    @Basic
    @Column(name = "loyalty_voucher_image_path")
    public String getLoyaltyVoucherImagePath() {
        return loyaltyVoucherImagePath;
    }

    public void setLoyaltyVoucherImagePath(String loyaltyVoucherImagePath) {
        this.loyaltyVoucherImagePath = loyaltyVoucherImagePath;
    }

    @Basic
    @Column(name = "adv_image_folder")
    public String getAdvImageFolder() {
        return advImageFolder;
    }

    public void setAdvImageFolder(String advImageFolder) {
        this.advImageFolder = advImageFolder;
    }

    @Basic
    @Column(name = "adv_video_folder")
    public String getAdvVideoFolder() {
        return advVideoFolder;
    }

    public void setAdvVideoFolder(String advVideoFolder) {
        this.advVideoFolder = advVideoFolder;
    }

    @Basic
    @Column(name = "news_image_folder")
    public String getNewsImageFolder() {
        return newsImageFolder;
    }

    public void setNewsImageFolder(String newsImageFolder) {
        this.newsImageFolder = newsImageFolder;
    }

    @Basic
    @Column(name = "content_image_folder")
    public String getContentImageFolder() {
        return contentImageFolder;
    }

    public void setContentImageFolder(String contentImageFolder) {
        this.contentImageFolder = contentImageFolder;
    }

    @Basic
    @Column(name = "news_category_folder")
    public String getNewsCategoryFolder() {
        return newsCategoryFolder;
    }

    public void setNewsCategoryFolder(String newsCategoryFolder) {
        this.newsCategoryFolder = newsCategoryFolder;
    }

    @Basic
    @Column(name = "app_icon_folder")
    public String getAppIconFolder() {
        return appIconFolder;
    }

    public void setAppIconFolder(String appIconFolder) {
        this.appIconFolder = appIconFolder;
    }

    @Basic
    @Column(name = "game_image_folder")
    public String getGameImageFolder() {
        return gameImageFolder;
    }

    public void setGameImageFolder(String gameImageFolder) {
        this.gameImageFolder = gameImageFolder;
    }

    @Basic
    @Column(name = "loyalty_phone_card_image_folder")
    public String getLoyaltyPhoneCardImageFolder() {
        return loyaltyPhoneCardImageFolder;
    }

    public void setLoyaltyPhoneCardImageFolder(String loyaltyPhoneCardImageFolder) {
        this.loyaltyPhoneCardImageFolder = loyaltyPhoneCardImageFolder;
    }

    @Basic
    @Column(name = "loyalty_voucher_image_folder")
    public String getLoyaltyVoucherImageFolder() {
        return loyaltyVoucherImageFolder;
    }

    public void setLoyaltyVoucherImageFolder(String loyaltyVoucherImageFolder) {
        this.loyaltyVoucherImageFolder = loyaltyVoucherImageFolder;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SystemParameter that = (SystemParameter) o;

        if (id != that.id) return false;
        if (advImagePath != null ? !advImagePath.equals(that.advImagePath) : that.advImagePath != null) return false;
        if (advVideoPath != null ? !advVideoPath.equals(that.advVideoPath) : that.advVideoPath != null) return false;
        if (newsImagePath != null ? !newsImagePath.equals(that.newsImagePath) : that.newsImagePath != null)
            return false;
        if (contentImagePath != null ? !contentImagePath.equals(that.contentImagePath) : that.contentImagePath != null)
            return false;
        if (newsCategoryPath != null ? !newsCategoryPath.equals(that.newsCategoryPath) : that.newsCategoryPath != null)
            return false;
        if (appIconPath != null ? !appIconPath.equals(that.appIconPath) : that.appIconPath != null) return false;
        if (gameImagePath != null ? !gameImagePath.equals(that.gameImagePath) : that.gameImagePath != null)
            return false;
        if (advImageFolder != null ? !advImageFolder.equals(that.advImageFolder) : that.advImageFolder != null)
            return false;
        if (advVideoFolder != null ? !advVideoFolder.equals(that.advVideoFolder) : that.advVideoFolder != null)
            return false;
        if (newsImageFolder != null ? !newsImageFolder.equals(that.newsImageFolder) : that.newsImageFolder != null)
            return false;
        if (contentImageFolder != null ? !contentImageFolder.equals(that.contentImageFolder) : that.contentImageFolder != null)
            return false;
        if (newsCategoryFolder != null ? !newsCategoryFolder.equals(that.newsCategoryFolder) : that.newsCategoryFolder != null)
            return false;
        if (appIconFolder != null ? !appIconFolder.equals(that.appIconFolder) : that.appIconFolder != null)
            return false;
        if (gameImageFolder != null ? !gameImageFolder.equals(that.gameImageFolder) : that.gameImageFolder != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (advImagePath != null ? advImagePath.hashCode() : 0);
        result = 31 * result + (advVideoPath != null ? advVideoPath.hashCode() : 0);
        result = 31 * result + (newsImagePath != null ? newsImagePath.hashCode() : 0);
        result = 31 * result + (contentImagePath != null ? contentImagePath.hashCode() : 0);
        result = 31 * result + (newsCategoryPath != null ? newsCategoryPath.hashCode() : 0);
        result = 31 * result + (appIconPath != null ? appIconPath.hashCode() : 0);
        result = 31 * result + (gameImagePath != null ? gameImagePath.hashCode() : 0);
        result = 31 * result + (advImageFolder != null ? advImageFolder.hashCode() : 0);
        result = 31 * result + (advVideoFolder != null ? advVideoFolder.hashCode() : 0);
        result = 31 * result + (newsImageFolder != null ? newsImageFolder.hashCode() : 0);
        result = 31 * result + (contentImageFolder != null ? contentImageFolder.hashCode() : 0);
        result = 31 * result + (newsCategoryFolder != null ? newsCategoryFolder.hashCode() : 0);
        result = 31 * result + (appIconFolder != null ? appIconFolder.hashCode() : 0);
        result = 31 * result + (gameImageFolder != null ? gameImageFolder.hashCode() : 0);
        return result;
    }
}
