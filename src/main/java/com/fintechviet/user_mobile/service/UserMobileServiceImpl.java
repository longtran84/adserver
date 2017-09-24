package com.fintechviet.user_mobile.service;

import com.fintechviet.content.model.EarningDetails;
import com.fintechviet.user_mobile.dto.UserInfoDTO;
import com.fintechviet.user_mobile.dto.UserInviteDTO;
import com.fintechviet.user_mobile.model.UserMobile;
import com.fintechviet.user_mobile.repository.EarningDetailsRepository;
import com.fintechviet.user_mobile.repository.UserMobileRepository;
import com.fintechviet.utils.DateUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.math.BigInteger;
import java.util.*;

@Service
public class UserMobileServiceImpl implements UserMobileService {

    @Autowired
    private UserMobileRepository userMobileRepository;

    @Autowired
    private EarningDetailsRepository earningDetailsRepository;

    @Value("${user.inviteEarning}")
    private long inviteEarning;


    @Override
    public void updateStatus(Long id, String status) {
        userMobileRepository.updateStatus(status, id);
    }

    @Override
    public List<UserInfoDTO> getUserInfo(Date from, Date to) {
        List<Object[]> result = userMobileRepository.getUserInfo(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to));
        List<UserInfoDTO> users = new ArrayList<UserInfoDTO>();
        for (Object row[] : result) {
            BigInteger id = (BigInteger)row[0];
            String username  = (String)row[1];
            String gender  = (String)row[2];
            Integer dob = (Integer)row[3];
            String location = (String)row[4];
            BigInteger earning = (BigInteger)row[5];
            String inviteCodeUsed = (String)row[7];
            String status = (String)row[9];
            Date createdDate = (Date)row[10];
            String interests = (String)row[11];
            BigInteger devices = (BigInteger)row[12];
            String userInvite  = (String)row[13];
            UserInfoDTO userInfoDTO = new UserInfoDTO();
            userInfoDTO.setId(id.longValue());
            userInfoDTO.setUsername(username);
            userInfoDTO.setGender(gender);
            userInfoDTO.setDob(dob.intValue());
            userInfoDTO.setLocation(location);
            userInfoDTO.setEarning(earning.longValue());
            userInfoDTO.setInviteCodeUsed(inviteCodeUsed);
            userInfoDTO.setStatus(status);
            userInfoDTO.setCreatedDate(createdDate);
            userInfoDTO.setInterests(StringUtils.isNotEmpty(interests) ? interests.replaceAll(",", ", ") : "");
            userInfoDTO.setDevices(devices.intValue());
            userInfoDTO.setUserInvite(userInvite);
            users.add(userInfoDTO);
        }
        return users;
    }

    @Override
    public List<UserInviteDTO> getUserInvite(Date from, Date to) {
        List<Object[]> result = userMobileRepository.getUserInvite(DateUtils.convertDateToStringDB(from), DateUtils.convertDateToStringDB(to));
        List<UserInviteDTO> users = new ArrayList<UserInviteDTO>();
        for (Object row[] : result) {
            BigInteger id = (BigInteger)row[0];
            String username  = (String)row[1];
            String status = (String)row[2];
            BigInteger earning = (BigInteger)row[3];
            Date createdDate = (Date)row[4];
            String[] inviter = ((String) row[5]).split(",");
            UserInviteDTO userInviteDTO = new UserInviteDTO();
            userInviteDTO.setId(id.longValue());
            userInviteDTO.setUsername(username);
            userInviteDTO.setEarning(earning.longValue());
            userInviteDTO.setStatus(status);
            userInviteDTO.setCreatedDate(createdDate);
            userInviteDTO.setIdInvite(Long.valueOf(inviter[0]));
            userInviteDTO.setUsernameInvite(inviter[1]);
            users.add(userInviteDTO);
        }
        return users;
    }

    @Override
    public void updateEarningForUser() {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.HOUR, -24);

        List<String> inviteCodes = userMobileRepository.getInviteCodesUsed(cal.getTime());

        Hashtable<String, Integer> hashInviteCode = new Hashtable<String, Integer>();
        for(String inviteCode : inviteCodes) {
            if (!hashInviteCode.containsKey(inviteCode)) {
                hashInviteCode.put(inviteCode, 1);
            } else {
                Integer count = hashInviteCode.get(inviteCode);
                count++;
                hashInviteCode.put(inviteCode, count);
            }
        }
        Set<String> keys = hashInviteCode.keySet();
        for (String key: keys){
            userMobileRepository.updateEarningForUser(inviteEarning * hashInviteCode.get(key) , key);
            EarningDetails earningDetails = userMobileRepository.getInviteEarningDetail(key);
            if (earningDetails != null) {
                userMobileRepository.updateEarningDetailForUser(inviteEarning * hashInviteCode.get(key), key);
            } else {
                UserMobile userMobile = userMobileRepository.findByInviteCode(key);
                EarningDetails ed = new EarningDetails();
                ed.setUid(userMobile.getId());
                ed.setEvent("INVITE");
                ed.setAmount(inviteEarning * hashInviteCode.get(key));
                earningDetailsRepository.save(ed);
            }
        }
        userMobileRepository.updateUserInvited(cal.getTime());
    }

}

