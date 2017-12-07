package com.fintechviet.content.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fintechviet.user_mobile.model.UserMobile;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.util.Set;

/**
 * Created by tungn on 9/12/2017.
 */
@Entity
@Table(name = "news_category")
public class NewsCategory {
    private Long id;
    private String code;
    private String name;
    private String image;
    private String status = "NEW";
    @JsonIgnoreProperties("newsCategories")
    private Set<UserMobile> userMobiles;
    private MultipartFile imageFile;
    private String imageName;

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
    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "image")
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Transient
    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    @Basic
    @Column(name = "status")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @ManyToMany(mappedBy = "newsCategories")
    public Set<UserMobile> getUserMobiles() {
        return userMobiles;
    }

    public void setUserMobiles(Set<UserMobile> userMobiles) {
        this.userMobiles = userMobiles;
    }

    @Transient
    public MultipartFile getImageFile() {
        return imageFile;
    }

    public void setImageFile(MultipartFile imageFile) {
        this.imageFile = imageFile;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        NewsCategory that = (NewsCategory) o;

        if (id != that.id) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (image != null ? !image.equals(that.image) : that.image != null) return false;
        if (status != null ? !status.equals(that.status) : that.status != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = (int) (id ^ (id >>> 32));
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (image != null ? image.hashCode() : 0);
        result = 31 * result + (status != null ? status.hashCode() : 0);
        return result;
    }
}
