package com.fintechviet.content.repository;


import com.fintechviet.content.model.NewsCategory;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * Created by tungn on 9/12/2017.
 */
public interface NewsCategoryRepository extends JpaRepository<NewsCategory, Long> {
}
