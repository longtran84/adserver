package com.fintechviet.user_mobile.repository;


import com.fintechviet.content.model.EarningDetails;
import com.fintechviet.user_mobile.model.UserMobile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.Temporal;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import javax.persistence.TemporalType;
import java.util.Date;
import java.util.List;


/**
 * Created by tungn on 9/12/2017.
 */
public interface UserMobileRepository extends JpaRepository<UserMobile, Long> {
    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE UserMobile SET status = :status WHERE id = :id")
    void updateStatus(@Param("status") String status, @Param("id") Long id);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE UserMobile SET earning = earning + :amount WHERE id = :id")
    void refundEarning(@Param("amount") long amount, @Param("id") Long id);

    //Query user mobile by range date
    @Query(value="SELECT *, (SELECT GROUP_CONCAT(nec.name) FROM news_category nec WHERE nec.id IN " +
                 "(SELECT newsCategoryId FROM user_mobile_interest umi WHERE umi.uid = u.id) GROUP BY u.id) AS interests, " +
                 "(SELECT COUNT(*) FROM user_mobile_device_token udt WHERE udt.uid = u.id GROUP BY udt.uid) AS devices, " +
                 "(SELECT uiv.username FROM user_mobile uiv WHERE uiv.inviteCode = u.inviteCodeUsed) AS userInviter " +
                 "FROM user_mobile u WHERE u.createdDate BETWEEN :from AND :to", nativeQuery = true)
    List<Object[]> getUserInfo(@Param("from") String from, @Param("to") String to);

    //Query user mobile invite by range date
    @Query(value="SELECT u.id, u.username, u.status, u.earning, u.createdDate, " +
                 "(SELECT GROUP_CONCAT(CONCAT(CONCAT(uiv.id, ','), uiv.username)) FROM user_mobile uiv WHERE uiv.inviteCode = u.inviteCodeUsed) AS userInviter " +
                 "FROM user_mobile u WHERE u.inviteCodeUsed <> '' AND u.createdDate BETWEEN :from AND :to", nativeQuery = true)
    List<Object[]> getUserInvite(@Param("from") String from, @Param("to") String to);

    @Query("SELECT inviteCodeUsed FROM UserMobile WHERE createdDate <= :date24h AND isRewardForUserInvite = 0 AND inviteCodeUsed IS NOT NULL")
    List<String> getInviteCodesUsed(@Param("date24h") @Temporal(TemporalType.TIMESTAMP) Date date24h);

    @Query("SELECT e FROM EarningDetails e WHERE e.rewardCode = 'INVITE' AND e.uid = (SELECT id FROM UserMobile WHERE inviteCode = :inviteCode)")
    EarningDetails getInviteEarningDetail(@Param("inviteCode") String inviteCode);

    UserMobile findByInviteCode(String inviteCode);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE UserMobile SET earning = earning + :inviteEarning WHERE inviteCode = :inviteCode")
    void updateEarningForUser(@Param("inviteEarning") long inviteEarning, @Param("inviteCode") String inviteCode);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE EarningDetails SET amount = amount + :inviteEarning WHERE uid = (SELECT id FROM UserMobile WHERE inviteCode = :inviteCode) AND rewardCode = 'INVITE'")
    void updateEarningDetailForUser(@Param("inviteEarning") long inviteEarning, @Param("inviteCode") String inviteCode);

    @Modifying
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    @Query("UPDATE UserMobile u SET u.isRewardForUserInvite = 1 WHERE u.createdDate <= :date24h AND u.isRewardForUserInvite = 0 AND u.inviteCodeUsed IS NOT NULL")
    void updateUserInvited(@Param("date24h") @Temporal(TemporalType.TIMESTAMP) Date date24h);

    //Query user mobile invite by range date
    @Query("SELECT u FROM UserMobile u WHERE u.status = 'ACTIVE'")
    List<UserMobile> getUserActives();
}
