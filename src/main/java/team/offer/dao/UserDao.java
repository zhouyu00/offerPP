package team.offer.dao;

import team.offer.entity.Position;
import team.offer.entity.User;

import java.util.List;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 17:30 2018/1/18
 * @Modified By:
 */
public interface UserDao {
    //根据用户id查询用户
    User queryUserById(Integer id) throws Exception;

    //根据邮箱获取用户信息
    User queryUserByEmail(String email) throws Exception;

    //增加一条用户记录
    void insertUser(User user) throws Exception;

    //根据邮箱和密码查询用户
    User queryUserByEmailAndPassword(String email,String password) throws Exception;

    //根据id修改用户密码
    void updateUserPasswordById(Integer id,String password) throws Exception;

    //根据id查询用户收藏的职位
    List<Position> queryCollectionById(Integer id) throws Exception;

    //根据职位id删除用户收藏的职位
    void deleteCollectionById(Integer id) throws Exception;

    //根据用户id查询新投递的职位
    List<Position> queryNewApplicationById(Integer id) throws Exception;

    //根据用户id查询已查阅的职位
    List<Position> queryConsultedApplicationById(Integer id) throws Exception;

    //根据用户id查询待安排的职位
    List<Position> queryArrangedApplicationById(Integer id) throws Exception;

    //根据用户id和职位id查询申请id
    Integer queryApplicationIdByUidAndPid(Integer uid,Integer pid) throws Exception;

    //增加一条申请表记录
    void insertApplication(Integer uid,Integer pid) throws Exception;

    //根据用户id和职位id查询收藏id
    Integer queryCollectionIdByUidAndPid(Integer uid,Integer pid) throws Exception;

    //增加一条收藏表记录
    void insertCollection(Integer uid,Integer pid) throws Exception;
}
