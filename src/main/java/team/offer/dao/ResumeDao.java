package team.offer.dao;

import org.springframework.stereotype.Repository;
import team.offer.entity.User;


/**
 * Created by Administrator on 2018/2/28.
 */
@Repository
public interface ResumeDao {
    //修改用户个人信息
    public void setPersonalInformationById(User user)throws Exception;
    //获取用户个人信息
    public User getPersonalInformationById(int id)throws Exception;
    //修改用户职业期望
    //public void setCareerExceptionById(User user)throws Exception;
    //获取用户职业期望
    //public User getCareerExceptionById(int id)throws Exception;
    //修改用户技能信息
    public void setSkillsInformationById(User user)throws Exception;
    //获取用户技能信息
    public User getSkillsInformationById(int id)throws Exception;
    //修改用户教育和工作经历
    public void setCareerAndEducationExpById(User user)throws Exception;
    //获取用户教育和工作经历
    public User getCareerAndEducationExpById(int id)throws Exception;
    //修改用户个人描述
    public void setPersonalDescriptionById(User user)throws Exception;
    //获取用户个人描述
    public User getPersonalDescriptionById(int id)throws Exception;
    //获取用户简历
    public User queryResumeInformationById(int id)throws Exception;

}
