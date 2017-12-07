package com.fintechviet.ads.model;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by tungn on 9/11/2017.
 */
@Entity
@Table(name = "cpe")
public class Cpe {
    private long id;
    private String deviceId;
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
    @Column(name = "deviceId")
    public String getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(String deviceId) {
        this.deviceId = deviceId;
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

        Cpe cpe = (Cpe) o;

        if (id != cpe.id) return false;
        if (deviceId != null ? !deviceId.equals(cpe.deviceId) : cpe.deviceId != null) return false;
        if (date != null ? !date.equals(cpe.date) : cpe.date != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (deviceId != null ? deviceId.hashCode() : 0);
        result = 31 * result + (date != null ? date.hashCode() : 0);
        return result;
    }
}
