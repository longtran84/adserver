package com.fintechviet.ads.repository;

import com.fintechviet.ads.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    @Query("SELECT usr FROM User usr WHERE usr.username <> :username AND usr.id IN (SELECT ur.userId FROM UserRole ur WHERE ur.roleId IN (SELECT rol.id FROM Role rol WHERE rol.name = 'ROLE_ADMIN' OR rol.name = 'ROLE_SUPER_ADMIN'))")
    List<User> findAdmins(@Param("username") String username);
}
