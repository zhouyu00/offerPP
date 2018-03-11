package team.offer.service;

import team.offer.entity.Company;
import team.offer.entity.Position;
import team.offer.entity.User;

import java.util.List;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 16:04 2018/1/19
 * @Modified By:
 */

public interface CompanyService {
    public Company  getCompanyById(int id)throws Exception;

    public Company getCompanyByEmail(String email) throws Exception;

    //验证邮箱的存在
    public boolean verifyComEmail(String email)throws Exception;

    //
    public boolean verifyPassword(String password)throws Exception;

    //
    public boolean verifyComNo(Integer comNo)throws Exception;

    public void insertCompany(Company company) throws Exception;

    public List<Company> getCompanyList()throws Exception;

    public void updateCompany(Company company)throws Exception;

    public List<User> getResumes(Integer pkPositionId) throws Exception;

    public User getResumeDetails(Integer pkUserId)throws Exception;

    public boolean passResume(Integer userId)throws Exception;

    public boolean refuseResume(Integer userId)throws Exception;

    public int getApplicationStatusById(Integer userId,Integer pid)throws Exception;

    //按公司id返回职位列表
    List<Position> queryPositionByComId(Integer comId) throws Exception;

    //插入职位
    void insertPosition(Position position)throws Exception;

    //根据职位id删除职位及申请
    void deletePosition(Integer pkPositionId)throws Exception;

}
