package com.fintechviet.content.repository;


import com.fintechviet.content.model.News;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * Created by tungn on 9/12/2017.
 */
public interface NewsRepository extends JpaRepository<News, Long> {
}
