package com.fintechviet.ads.model;

import com.fintechviet.user_mobile.model.UserMobile;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by tungn on 9/6/2017.
 */
@Entity
@Table(name = "ad_clicks")
public class AdClicks {
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

    @Basic
    @Column(name = "date", columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AdClicks adClicks = (AdClicks) o;

        if (id != adClicks.id) return false;
        if (date != null ? !date.equals(adClicks.date) : adClicks.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
