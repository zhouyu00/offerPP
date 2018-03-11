package team.offer.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import team.offer.dao.CompanyDao;
import team.offer.entity.Company;
import team.offer.entity.Position;
import team.offer.entity.User;
import team.offer.service.CompanyService;

import java.util.List;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 16:07 2018/1/19
 * @Modified By:
 */
@Service
public class CompanyServiceImpl implements CompanyService{


    @Autowired
    private CompanyDao companyDao;


    //---------------------------测试方法--------------------------//
    //根据id获取company实例
    public Company getCompanyById(int id){
        Company company=null;
        try {
            company = companyDao.getCompanyById(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return company;
    }


    //获取所有公司列表
    public List<Company> getCompanyList()throws Exception{
        return companyDao.getCompanyList();
    }

    //---------------------------生产方法--------------------------//
    //插入company
    public void insertCompany(Company company){
        try {
            companyDao.insertCompany(company);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //根据email获取company实例
    public Company getCompanyByEmail(String email){
        Company company=null;
        try {
            company=companyDao.getCompanyByEmail(email);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return company;
    }


    //根据email验证是否合法
    public boolean verifyComEmail(String email)throws Exception{
        //邮箱格式
        //String regix="^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$";
        if(companyDao.getCompanyByEmail(email)==null){
            return false;
        }
        //return email.matches(regix);
        return true;
    }

    //验证密码是否合法
    public boolean verifyPassword(String password){
        if(password.length()<6||password.length()>16)
            return false;
        else return true;
    }

    //验证公司注册码是否合法
    public boolean verifyComNo(Integer comNo){
        return comNo==null?false:true;
    }

    //更新公司信息
    public void updateCompany(Company company)throws Exception{
        companyDao.updateCompany(company);
    }

    //根据职位id查询简历
    public List<User> getResumes(Integer pkPositionId)throws Exception{
        List<User> Resumes= companyDao.getResumes(pkPositionId);

        return Resumes;
    }

    //根据userId查询简历详情
    public User getResumeDetails(Integer pkUserId)throws Exception{
        return companyDao.getResumeDetails(pkUserId);
    }


    //根据userid通知面试
    public boolean passResume(Integer userId){
        try {
            companyDao.updateResumeById(userId,1);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    //根据userId拒绝申请
    public boolean refuseResume(Integer userId){
        try {
            companyDao.updateResumeById(userId,-1);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    //根据userId查询简历状态
    public int getApplicationStatusById(Integer userId,Integer pid)throws Exception{
        return companyDao.getApplicationStatusById(userId,pid);
    }

    //-----------------职位方法----------------//

    //插入职位
    public void insertPosition(Position position) throws Exception{
        companyDao.insertPosition(position);
    }

    //返回职位列表根据公司id
    public List<Position> queryPositionByComId(Integer comId)throws Exception{
        return companyDao.queryPositionByComId(comId);
    }

    //删除职位根据职位id
    public void deletePosition(Integer pkPositionId)throws Exception{
        companyDao.deleteApplicaitonByPositionId(pkPositionId);
       companyDao.deletePositionById(pkPositionId);

    }


}
