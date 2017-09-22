package com.fintechviet.user_mobile.web;

import com.fintechviet.user_mobile.dto.UserInfoDTO;
import com.fintechviet.user_mobile.dto.UserInviteDTO;
import com.fintechviet.user_mobile.model.UserMobile;
import com.fintechviet.user_mobile.request.UserMobileRequest;
import com.fintechviet.user_mobile.service.UserMobileService;
import com.fintechviet.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;
import java.util.List;

/**
 * Created by tungn on 9/12/2017.
 */
@RestController
public class UserMobileRestController {
    @Autowired
    private UserMobileService userMobileService;


    @RequestMapping(value = "/user/userInfos", method = RequestMethod.POST)
    public List<UserInfoDTO> userInfos(@RequestBody UserMobileRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo() + " 23:59:59");
        return userMobileService.getUserInfo(from, to);
    }

    @RequestMapping(value = "/user/userInvites", method = RequestMethod.POST)
    public List<UserInviteDTO> userInvites(@RequestBody UserMobileRequest request){
        Date from = DateUtils.convertStringToDate(request.getDateFrom()  + " 00:00:00");
        Date to = DateUtils.convertStringToDate(request.getDateTo() + " 23:59:59");
        return userMobileService.getUserInvite(from, to);
    }

    @RequestMapping(value = "/user/activate", method = RequestMethod.POST)
    public ResponseEntity<?> activateCampaign(@RequestBody UserMobile userMobile) {
        try {
            String status = userMobile.getStatus().equals("ACTIVE") ? "INACTIVE" : "ACTIVE";
            userMobileService.updateStatus(userMobile.getId(), status);
        } catch (Exception ex) {
            return ResponseEntity.badRequest().body("Error");
        }
        return ResponseEntity.ok(userMobile.getId());
    }
}

