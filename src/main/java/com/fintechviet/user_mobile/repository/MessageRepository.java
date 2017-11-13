package com.fintechviet.user_mobile.repository;

import com.fintechviet.user_mobile.model.Message;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MessageRepository extends JpaRepository<Message, Long> {
}
