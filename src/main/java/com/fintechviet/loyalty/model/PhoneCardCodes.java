package com.fintechviet.loyalty.model;

import javax.persistence.*;

/**
 * Created by tungn on 11/21/2017.
 */
@Entity
@Table(name = "phone_card_codes", schema = "mobileads", catalog = "")
public class PhoneCardCodes {
    private int id;
    private Integer phoneCardId;
    private String code;
    private Byte isDeliver;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "phoneCardId")
    public Integer getPhoneCardId() {
        return phoneCardId;
    }

    public void setPhoneCardId(Integer phoneCardId) {
        this.phoneCardId = phoneCardId;
    }

    @Basic
    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "isDeliver")
    public Byte getIsDeliver() {
        return isDeliver;
    }

    public void setIsDeliver(Byte isDeliver) {
        this.isDeliver = isDeliver;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        PhoneCardCodes that = (PhoneCardCodes) o;

        if (id != that.id) return false;
        if (phoneCardId != null ? !phoneCardId.equals(that.phoneCardId) : that.phoneCardId != null) return false;
        if (code != null ? !code.equals(that.code) : that.code != null) return false;
        if (isDeliver != null ? !isDeliver.equals(that.isDeliver) : that.isDeliver != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (phoneCardId != null ? phoneCardId.hashCode() : 0);
        result = 31 * result + (code != null ? code.hashCode() : 0);
        result = 31 * result + (isDeliver != null ? isDeliver.hashCode() : 0);
        return result;
    }
}
