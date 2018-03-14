package team.offer.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.offer.dao.UserDao;
import team.offer.entity.Company;
import team.offer.entity.Position;
import team.offer.entity.PositionVo;
import team.offer.entity.User;
import team.offer.service.UserService;
import team.offer.util.MD5Util;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 12:55 2018/1/18
 * @Modified By:
 */
@Service
public class UserServiceImpl implements UserService {
    //注入mapper
    @Resource
    private UserDao userDao;

    @Transactional
    /**
     * 使用注解控制事务方法的优点：
     * 1.开发团队达成一致约定，明确标注事务方法的编程风格
     * 2.保证事务方法的执行时间尽可能短，不要穿插其他网络操作RPC/HTTP请求或者剥离到事务方法外部
     * 3.不是所有的方法都需要事务，如只有一条修改操作、只读操作不要事务控制
     */
    public User findUserById(Integer id) throws Exception {

        return userDao.queryUserById(id);
    }

    public User findUserByEmail(String email) throws Exception{
        return userDao.queryUserByEmail(email);
    }

    public boolean register(User user) throws Exception {
        //判断用户是否重复注册
        if (userDao.queryUserByEmail(user.getUserEmail()) != null) {
            return false;
        } else {
            //密码加密
            String encodedPassword = MD5Util.MD5(user.getUserPassword());
            user.setUserPassword(encodedPassword);
            //保存到数据库
            userDao.insertUser(user);
            return true;
        }
    }

    public boolean login(User user) throws Exception {
        //将密码进行MD5加密
        user.setUserPassword(MD5Util.MD5(user.getUserPassword()));
        //进行登录验证
        if (userDao.queryUserByEmailAndPassword(user.getUserEmail(), user.getUserPassword()) != null) {
            //如果验证通过，保存用户上线时间
            user.setUserName(userDao.queryUserByEmailAndPassword(user.getUserEmail(),user.getUserPassword()).getUserName());
            long loginTime = System.currentTimeMillis();
            userDao.updateTime(user.getUserEmail(), loginTime);
            user.setPkUserId(userDao.queryUserByEmailAndPassword(user.getUserEmail(), user.getUserPassword()).getPkUserId());
            return true;
        } else {
            return false;
        }
    }

    public boolean verifyEmail(String email) throws Exception {
        //验证邮箱是否存在，存在返回true，否则返回false
        if (userDao.queryUserByEmail(email) == null) {
            return false;
        } else {
            return true;
        }
    }

    public void forgetPassword(String email, String password) throws Exception {
        userDao.updateUserPasswordByEmail(email, MD5Util.MD5(password));
    }

    public boolean changePassword(User loginUser, String oldPassword, String newPassword) throws Exception {
        //验证输入的旧密码是否正确
        if (!loginUser.getUserPassword().equals(MD5Util.MD5(oldPassword))) {
            return false;
        } else {
            //如果正确，将新密码加密后存入数据库
            userDao.updateUserPasswordByEmail(loginUser.getUserEmail(), MD5Util.MD5(newPassword));
            return true;
        }
    }

    public List<PositionVo> newApplication(Integer id) throws Exception {
        //由用户id获取新投递的职位集合
        List<Position> positions = userDao.queryNewApplicationById(id);
        //遍历职位，获取公司名称和所属行业，并添加到PositionVo中
        List<PositionVo> positionVos = new ArrayList<PositionVo>();
        for (Position position : positions) {
            Integer companyId = position.getComId();
            Company company = userDao.queryCompanyById(companyId);
            PositionVo positionVo = new PositionVo();
            positionVo.setPosition(position);
            positionVo.setCompanyName(company.getComName());
            positionVo.setCompanyIndustry(company.getComIndustry());
            positionVos.add(positionVo);
        }
        return positionVos;
    }

    public List<PositionVo> consultedApplication(Integer id) throws Exception {
        //由用户id获取已查询的职位集合
        List<Position> positions = userDao.queryConsultedApplicationById(id);
        //遍历职位，获取公司名称和所属行业，并添加到PositionVo中
        List<PositionVo> positionVos = new ArrayList<PositionVo>();
        for (Position position : positions) {
            Integer companyId = position.getComId();
            Company company = userDao.queryCompanyById(companyId);
            PositionVo positionVo = new PositionVo();
            positionVo.setPosition(position);
            positionVo.setCompanyName(company.getComName());
            positionVo.setCompanyIndustry(company.getComIndustry());
            positionVos.add(positionVo);
        }
        return positionVos;
    }

    public List<PositionVo> arrangedApplication(Integer id) throws Exception {
        //由用户id获取待安排的职位集合
        List<Position> positions = userDao.queryArrangedApplicationById(id);
        //遍历职位，获取公司名称和所属行业，并添加到PositionVo中
        List<PositionVo> positionVos = new ArrayList<PositionVo>();
        for (Position position : positions) {
            Integer companyId = position.getComId();
            Company company = userDao.queryCompanyById(companyId);
            PositionVo positionVo = new PositionVo();
            positionVo.setPosition(position);
            positionVo.setCompanyName(company.getComName());
            positionVo.setCompanyIndustry(company.getComIndustry());
            positionVos.add(positionVo);
        }
        return positionVos;
    }

    public List<PositionVo> queryCollection(Integer id) throws Exception {
        //由用户id获取用户收藏的职位集合
        List<Position> positions = userDao.queryCollectionById(id);
        //遍历职位，获取公司名称和所属行业，并添加到PositionVo中
        List<PositionVo> positionVos = new ArrayList<PositionVo>();
        for (Position position : positions) {
            Integer companyId = position.getComId();
            Company company = userDao.queryCompanyById(companyId);
            PositionVo positionVo = new PositionVo();
            positionVo.setPosition(position);
            positionVo.setCompanyName(company.getComName());
            positionVo.setCompanyIndustry(company.getComIndustry());
            positionVos.add(positionVo);
        }
        return positionVos;
    }

    public boolean collectionPosition(Integer uid, Integer pid) throws Exception {
        //查看用户是否已经收藏该职位，如果没有收藏，插入该条记录返回true
        if(userDao.queryCollectionIdByUidAndPid(uid,pid)==null){
            userDao.insertCollection(uid,pid);
            return true;
        }
        //否则，返回false
        else{
            return false;
        }
    }

    public boolean deleteCollection(Integer uid,Integer pid) throws Exception {
        //查看用户是否已经收藏该职位，如果收藏，则删除该条记录返回true
        if(userDao.queryCollectionIdByUidAndPid(uid,pid)!=null){
            userDao.deleteCollectionById(uid,pid);
            return true;
        }
        //否则，返回false
        else{
            return false;
        }
    }


    public boolean deliverPosition(Integer uid, Integer pid) throws Exception {
        if(userDao.queryApplicationIdByUidAndPid(uid,pid)==null){
            userDao.insertApplication(uid,pid);
            return true;
        }else{
            return false;
        }
    }

}
