package com.fintechviet.content.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by tungn on 9/27/2017.
 */
@Entity
@Table(name = "content")
public class Content {
    private long id;
    private String title;
    private String link;
    private String originalLink;
    private Integer noOfLike;
    private String status = "ACTIVE";
    private Set<ContentDetails> contentDetails;
    private Timestamp createdDate;

    @Id
    @Column(name = "id")
    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "link")
    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Basic
    @Column(name = "originalLink")
    public String getOriginalLink() {
        return originalLink;
    }

    public void setOriginalLink(String originalLink) {
        this.originalLink = originalLink;
    }

    @Basic
    @Column(name = "noOfLike")
    public Integer getNoOfLike() {
        return noOfLike;
    }

    public void setNoOfLike(Integer noOfLike) {
        this.noOfLike = noOfLike;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "content", cascade = CascadeType.ALL)
    public Set<ContentDetails> getContentDetails() {
        return contentDetails;
    }

    public void setContentDetails(Set<ContentDetails> contentDetails) {
        this.contentDetails = contentDetails;
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

        Content content = (Content) o;

        if (id != content.id) return false;
        if (title != null ? !title.equals(content.title) : content.title != null) return false;
        if (link != null ? !link.equals(content.link) : content.link != null) return false;
        if (originalLink != null ? !originalLink.equals(content.originalLink) : content.originalLink != null)
            return false;
        if (noOfLike != null ? !noOfLike.equals(content.noOfLike) : content.noOfLike != null) return false;
        if (status != null ? !status.equals(content.status) : content.status != null) return false;
        if (createdDate != null ? !createdDate.equals(content.createdDate) : content.createdDate != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (link != null ? link.hashCode() : 0);
        result = 31 * result + (originalLink != null ? originalLink.hashCode() : 0);
        result = 31 * result + (noOfLike != null ? noOfLike.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        return result;
    }
}
