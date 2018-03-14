package team.offer.service;

import team.offer.entity.User;

/**
 * Created by Administrator on 2018/3/1.
 */
public interface ResumeService {
    //设置用户个人信息
    public void setPersonalInformation(User user)throws Exception;
    //获取用户个人信息
    public User getPersonalInformation(int id)throws Exception;
    //修改用户职业期望
    //public void setCareerException(User user)throws Exception;
    //获取用户职业期望
    //public User getCareerException(int id)throws Exception;
    //修改用户技能信息
    public void setSkillsInformation(User user)throws Exception;
    //获取用户技能信息
    public User getSkillsInformation(int id)throws Exception;
    //修改用户教育和工作经历
    public void setCareerAndEducationExp(User user)throws Exception;
    //获取用户教育和工作经历
    public User getCareerAndEducationExp(int id)throws Exception;
    //修改用户个人描述
    public void setPersonalDescription(User user)throws Exception;
    //获取用户个人描述
    public User getPersonalDescription(int id)throws Exception;
    //获取用户简历
    public User queryResumeInformation(int id)throws Exception;
}
