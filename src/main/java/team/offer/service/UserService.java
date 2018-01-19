package team.offer.service;

import team.offer.entity.User;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 8:46 2018/1/18
 * @Modified By:
 */
public interface UserService {

    //获取个人详细信息
    User findUserById(Integer id) throws Exception;
}
