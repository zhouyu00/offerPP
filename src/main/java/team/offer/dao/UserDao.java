package team.offer.dao;

import team.offer.entity.User;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 17:30 2018/1/18
 * @Modified By:
 */
public interface UserDao {
    //根据id查询用户
    User findUserById(Integer id) throws Exception;
}
