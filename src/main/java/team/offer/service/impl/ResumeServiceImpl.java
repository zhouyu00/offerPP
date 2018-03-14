package team.offer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.offer.dao.ResumeDao;
import team.offer.entity.User;
import team.offer.service.ResumeService;

import javax.validation.constraints.Null;

/**
 * Created by Administrator on 2018/3/1.
 */
@Service
public class ResumeServiceImpl implements ResumeService {
    @Autowired
    private ResumeDao resumeDao;

    public void setPersonalInformation(User user)throws Exception{
        resumeDao.setPersonalInformationById(user);
    }

    public User getPersonalInformation(int id)throws Exception{
        User user= null;
        user = resumeDao.getPersonalInformationById(id);
        return user;
    }

    public void setSkillsInformation(User user)throws Exception{
        resumeDao.setSkillsInformationById(user);
    }

    public User getSkillsInformation(int id)throws Exception{
        User user= null;
        user = resumeDao.getSkillsInformationById(id);
        return user;
    }

    public void setCareerAndEducationExp(User user)throws Exception{
        resumeDao.setCareerAndEducationExpById(user);
    }


    public User getCareerAndEducationExp(int id)throws Exception{
        User user= null;
        user = resumeDao.getCareerAndEducationExpById(id);
        return user;
    }

    public void setPersonalDescription(User user)throws Exception {
        resumeDao.setPersonalDescriptionById(user);
    }

    public User getPersonalDescription(int id)throws Exception{
        User description= null;
        description = resumeDao.getPersonalDescriptionById(id);
        return description;
    }


    public User queryResumeInformation(int id)throws Exception{
        User user= null;
        user = resumeDao.queryResumeInformationById(id);
        return user;
    }
}
