package com.fintechviet.user_mobile.model;

import com.fintechviet.ads.model.Advertiser;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by tungn on 10/2/2017.
 */
@Entity
public class Message {
    private Long id;
    private UserMobile userMobile;
    private String subject;
    private String body;
    private String type;
    private Byte read = 0;
    private Byte receive = 0;
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

    @ManyToOne
    @JoinColumn(name = "uid")
    public UserMobile getUser() {
        return userMobile;
    }

    public void setUser(UserMobile userMobile) {
        this.userMobile = userMobile;
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
    @Column(name = "[read]")
    public Byte getRead() {
        return read;
    }

    public void setRead(Byte read) {
        this.read = read;
    }

    @Basic
    @Column(name = "receive")
    public Byte getReceive() {
        return receive;
    }

    public void setReceive(Byte receive) {
        this.receive = receive;
    }

    @Basic
    @Column(name = "createdDate", columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
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

        Message message = (Message) o;

        if (id != message.id) return false;
        if (body != null ? !body.equals(message.body) : message.body != null) return false;
        if (read != null ? !read.equals(message.read) : message.read != null) return false;
        if (createdDate != null ? !createdDate.equals(message.createdDate) : message.createdDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (body != null ? body.hashCode() : 0);
        result = 31 * result + (read != null ? read.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        return result;
    }
}
