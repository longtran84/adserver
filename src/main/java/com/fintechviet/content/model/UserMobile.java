package com.fintechviet.content.model;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by tungn on 9/12/2017.
 */
@Entity
@Table(name = "user_mobile", schema = "mobileads", catalog = "")
public class UserMobile {
    private long id;
    private String email;
    private String gender;
    private String bod;
    private String location;
    private Double earning;
    private String status;
    private Set<NewsCategory> newsCategories;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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
    @Column(name = "bod")
    public String getBod() {
        return bod;
    }

    public void setBod(String bod) {
        this.bod = bod;
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
    public Double getEarning() {
        return earning;
    }

    public void setEarning(Double earning) {
        this.earning = earning;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @ManyToMany
    @JoinTable(name = "user_mobile_interest", joinColumns = @JoinColumn(name = "uid"), inverseJoinColumns = @JoinColumn(name = "newsCategoryId"))
    public Set<NewsCategory> getNewsCategories() {
        return newsCategories;
    }

    public void setNewsCategories(Set<NewsCategory> newsCategories) {
        this.newsCategories = newsCategories;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserMobile that = (UserMobile) o;

        if (id != that.id) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (gender != null ? !gender.equals(that.gender) : that.gender != null) return false;
        if (bod != null ? !bod.equals(that.bod) : that.bod != null) return false;
        if (location != null ? !location.equals(that.location) : that.location != null) return false;
        if (earning != null ? !earning.equals(that.earning) : that.earning != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (bod != null ? bod.hashCode() : 0);
        result = 31 * result + (location != null ? location.hashCode() : 0);
        result = 31 * result + (earning != null ? earning.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
