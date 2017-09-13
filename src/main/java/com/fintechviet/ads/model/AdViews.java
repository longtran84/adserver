package com.fintechviet.ads.model;

import com.fintechviet.user_mobile.model.UserMobile;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by tungn on 9/11/2017.
 */
@Entity
@Table(name = "ad_views", schema = "mobileads", catalog = "")
public class AdViews {
    private long id;
    private UserMobile userMobile;
    private Ad ad;
    private Timestamp date;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "date")
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @ManyToOne
    @JoinColumn(name = "uid")
    public UserMobile getUserMobile() {
        return userMobile;
    }

    public void setUserMobile(UserMobile userMobile) {
        this.userMobile = userMobile;
    }

    @ManyToOne
    @JoinColumn(name = "adId")
    public Ad getAd() {
        return ad;
    }

    public void setAd(Ad ad) {
        this.ad = ad;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdViews adViews = (AdViews) o;

        if (id != adViews.id) return false;
        if (date != null ? !date.equals(adViews.date) : adViews.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
