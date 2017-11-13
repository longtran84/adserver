package com.fintechviet.content.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by tungn on 10/25/2017.
 */
@Entity
@Table(name = "in_app_message", schema = "mobileads", catalog = "")
public class InAppMessage {
    private Long id;
    private String subject;
    private String body;
    private String type = "PRIMARY";
    private Integer userAgeFrom = 0;
    private Integer userAgeTo = 0;
    private String userGender;
    private String userLocation;
    private String userInterest;
    private String status = "NEW";
    private Timestamp createdDate;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "subject")
    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    @Basic
    @Column(name = "body")
    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Basic
    @Column(name = "user_age_from")
    public Integer getUserAgeFrom() {
        return userAgeFrom;
    }

    public void setUserAgeFrom(Integer userAgeFrom) {
        this.userAgeFrom = userAgeFrom;
    }

    @Basic
    @Column(name = "user_age_to")
    public Integer getUserAgeTo() {
        return userAgeTo;
    }

    public void setUserAgeTo(Integer userAgeTo) {
        this.userAgeTo = userAgeTo;
    }

    @Basic
    @Column(name = "user_gender")
    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    @Basic
    @Column(name = "user_location")
    public String getUserLocation() {
        return userLocation;
    }

    public void setUserLocation(String userLocation) {
        this.userLocation = userLocation;
    }

    @Basic
    @Column(name = "user_interest")
    public String getUserInterest() {
        return userInterest;
    }

    public void setUserInterest(String userInterest) {
        this.userInterest = userInterest;
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
    @Column(name = "createdDate")
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        InAppMessage that = (InAppMessage) o;

        if (id != that.id) return false;
        if (body != null ? !body.equals(that.body) : that.body != null) return false;
        if (userAgeFrom != null ? !userAgeFrom.equals(that.userAgeFrom) : that.userAgeFrom != null) return false;
        if (userAgeTo != null ? !userAgeTo.equals(that.userAgeTo) : that.userAgeTo != null) return false;
        if (userGender != null ? !userGender.equals(that.userGender) : that.userGender != null) return false;
        if (userLocation != null ? !userLocation.equals(that.userLocation) : that.userLocation != null) return false;
        if (userInterest != null ? !userInterest.equals(that.userInterest) : that.userInterest != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;
        if (createdDate != null ? !createdDate.equals(that.createdDate) : that.createdDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (body != null ? body.hashCode() : 0);
        result = 31 * result + (userAgeFrom != null ? userAgeFrom.hashCode() : 0);
        result = 31 * result + (userAgeTo != null ? userAgeTo.hashCode() : 0);
        result = 31 * result + (userGender != null ? userGender.hashCode() : 0);
        result = 31 * result + (userLocation != null ? userLocation.hashCode() : 0);
        result = 31 * result + (userInterest != null ? userInterest.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        return result;
    }
}
