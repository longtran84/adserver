package com.fintechviet.loyalty.model;

import javax.persistence.*;

/**
 * Created by tungn on 11/21/2017.
 */
@Entity
@Table(name = "phone_card_codes")
public class PhoneCardCodes {
    private int id;
    private Phonecard phonecard;
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

    @ManyToOne
    @JoinColumn(name = "phoneCardId")
    public Phonecard getPhonecard() {
        return phonecard;
    }

    public void setPhonecard(Phonecard phonecard) {
        this.phonecard = phonecard;
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
        if (code != null ? !code.equals(that.code) : that.code != null) return false;
        if (isDeliver != null ? !isDeliver.equals(that.isDeliver) : that.isDeliver != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (code != null ? code.hashCode() : 0);
        result = 31 * result + (isDeliver != null ? isDeliver.hashCode() : 0);
        return result;
    }
}
