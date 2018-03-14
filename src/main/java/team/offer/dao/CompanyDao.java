package team.offer.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import team.offer.entity.Company;
import team.offer.entity.Position;
import team.offer.entity.User;

import java.util.List;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 15:58 2018/1/19
 * @Modified By:
 */
@Repository
public interface CompanyDao {

    //增加一个企业用户
    public void insertCompany(@Param("company") Company company)throws Exception;

    //根据id查询(单个)用户
    public Company getCompanyById(@Param("pkComId") int pkComId)throws Exception;

    //根据email查询(单个)用户
    public Company getCompanyByEmail(@Param("comEmail") String comEmail)throws Exception;


    //获取公司列表
    public List<Company> getCompanyList()throws Exception;

    //更新公司信息
    public void updateCompany(@Param("company") Company company)throws Exception;

    //根据positionID查询申请简历（用户）
    public List<User> getResumes(@Param("pkPositionId") Integer pkPositionId)throws Exception;

    //根据userId查询简历详情
    public User getResumeDetails(@Param("pkUserId") Integer pkUserId)throws Exception;

    //根据userID更新简历状态
    public void updateResumeById(@Param("userId") Integer userId, @Param("pid") Integer pid,@Param("applicationStatus") Integer applicationStatus)throws Exception;

    //根据userId查询简历状态
    public Integer getApplicationStatusById(@Param("userId") Integer userId,@Param("pid")Integer pid)throws Exception;

    //根据企业id查询职位集合
    List<Position> queryPositionByComId(Integer comId)throws Exception;

    //插入职位
    void insertPosition(Position position)throws Exception;

    //根据职位id删除职位
    void deletePositionById(@Param("pkPositionId") Integer pkPositionId)throws Exception;

    //根据职位id删除申请
    void deleteApplicationByPositionId(@Param("positionId") Integer positionId)throws Exception;

    //完善信息
    public void completeCompany(@Param("company")Company company) throws Exception;
}
