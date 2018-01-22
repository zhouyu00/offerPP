package team.offer.service.impl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import team.offer.dao.UserDao;
import team.offer.entity.Position;
import team.offer.entity.User;
import team.offer.service.UserService;
import team.offer.service.exception.DeleteRepeatException;

import javax.annotation.Resource;
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

    public void register(User user) throws Exception {

    }

    public User login(User user) throws Exception {
        return null;
    }

    public void forgetPassword(String password) throws Exception {

    }

    public void updatePassword(String oldPassword, String newPassword) throws Exception {

    }

    public List<Position> collection(Integer id) throws Exception {
        return null;
    }

    public void deleteCollection(Integer id) throws Exception {

    }

    public List<Position> newApplication(Integer id) throws Exception {
        return null;
    }

    public List<Position> consultedApplication(Integer id) throws Exception {
        return null;
    }

    public List<Position> arrangedApplication(Integer id) throws Exception {
        return null;
    }

    public void deliverPosition(Integer uid, Integer pid) throws Exception {

    }

    public void collectionPosition(Integer uid, Integer pid) throws Exception {

    }
}
