package com.fintechviet.ads.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

/**
 * Created by tungn on 8/29/2017.
 */
@Entity
@Table(name = "creative")
public class Creative {
    private Long id;
    private AdType adType;
    private String title;
    private String body;
    private String alt;
    private String template;
    private String imageLink;
    private String videoLink;
    private String clickUrl;
    private String status = "NEW";
    private MultipartFile imageFile;
    private MultipartFile videoFile;
    private String imageName;
    private String videoName;
    private Timestamp createdDate;
    private String adTypeName;
    private Set<Ad> ads;

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
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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
    @Column(name = "alt")
    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    @Basic
    @Column(name = "template")
    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }

    @Basic
    @Column(name = "imageLink")
    public String getImageLink() {
        return imageLink;
    }

    public void setImageLink(String imageLink) {
        this.imageLink = imageLink;
    }

    @Basic
    @Column(name = "videoLink")
    public String getVideoLink() {
        return videoLink;
    }

    public void setVideoLink(String videoLink) {
        this.videoLink = videoLink;
    }

    @Transient
    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    @Transient
    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    @Basic
    @Column(name = "clickUrl")
    public String getClickUrl() {
        return clickUrl;
    }

    public void setClickUrl(String clickUrl) {
        this.clickUrl = clickUrl;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Transient
    public MultipartFile getImageFile() {
        return imageFile;
    }

    public void setImageFile(MultipartFile imageFile) {
        this.imageFile = imageFile;
    }

    @Transient
    public MultipartFile getVideoFile() {
        return videoFile;
    }

    public void setVideoFile(MultipartFile videoFile) {
        this.videoFile = videoFile;
    }

    @Basic
    @Column(name = "createdDate", columnDefinition="TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @ManyToOne
    @JoinColumn(name = "adTypeId")
    public AdType getAdType() {
        return adType;
    }

    public void setAdType(AdType adType) {
        this.adType = adType;
    }

    @Transient
    public String getAdTypeName() {
        return adTypeName;
    }

    public void setAdTypeName(String adTypeName) {
        this.adTypeName = adTypeName;
    }

    @JsonIgnore
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "creative", cascade = CascadeType.ALL)
    public Set<Ad> getAds() {
        return ads;
    }

    public void setAds(Set<Ad> ads) {
        this.ads = ads;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Creative creative = (Creative) o;

        if (id != creative.id) return false;
        if (title != null ? !title.equals(creative.title) : creative.title != null) return false;
        if (body != null ? !body.equals(creative.body) : creative.body != null) return false;
        if (alt != null ? !alt.equals(creative.alt) : creative.alt != null) return false;
        if (template != null ? !template.equals(creative.template) : creative.template != null) return false;
        if (imageLink != null ? !imageLink.equals(creative.imageLink) : creative.imageLink != null) return false;
        if (videoLink != null ? !videoLink.equals(creative.videoLink) : creative.videoLink != null) return false;
        if (status != null ? !status.equals(creative.status) : creative.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (body != null ? body.hashCode() : 0);
        result = 31 * result + (alt != null ? alt.hashCode() : 0);
        result = 31 * result + (template != null ? template.hashCode() : 0);
        result = 31 * result + (imageLink != null ? imageLink.hashCode() : 0);
        result = 31 * result + (videoLink != null ? videoLink.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
