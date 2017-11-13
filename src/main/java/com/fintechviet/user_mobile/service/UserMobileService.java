package com.fintechviet.user_mobile.service;



import com.fintechviet.user_mobile.dto.UserInfoDTO;
import com.fintechviet.user_mobile.dto.UserInviteDTO;
import com.fintechviet.user_mobile.model.UserMobile;

import java.util.Date;
import java.util.List;

public interface UserMobileService {
    List<UserInfoDTO> getUserInfo(Date from, Date to);
    List<UserInviteDTO> getUserInvite(Date from, Date to);
    void updateStatus(Long id, String status);
    void updateEarningForUser();
    List<UserMobile> getUserActives();
}
