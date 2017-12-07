package com.fintechviet.loyalty.model;

import javax.persistence.*;

/**
 * Created by tungn on 11/21/2017.
 */
@Entity
@Table(name = "voucher_codes", schema = "mobileads", catalog = "")
public class VoucherCodes {
    private int id;
    private Integer voucherId;
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
    @Column(name = "voucherId")
    public Integer getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(Integer voucherId) {
        this.voucherId = voucherId;
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

        VoucherCodes that = (VoucherCodes) o;

        if (id != that.id) return false;
        if (voucherId != null ? !voucherId.equals(that.voucherId) : that.voucherId != null) return false;
        if (code != null ? !code.equals(that.code) : that.code != null) return false;
        if (isDeliver != null ? !isDeliver.equals(that.isDeliver) : that.isDeliver != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (voucherId != null ? voucherId.hashCode() : 0);
        result = 31 * result + (code != null ? code.hashCode() : 0);
        result = 31 * result + (isDeliver != null ? isDeliver.hashCode() : 0);
        return result;
    }
}
