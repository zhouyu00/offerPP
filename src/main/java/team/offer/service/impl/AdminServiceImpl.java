package team.offer.service.impl;

        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.stereotype.Service;
        import team.offer.dao.AdminDao;
        import team.offer.entity.Admin;
        import team.offer.entity.Company;
        import team.offer.entity.User;
        import team.offer.service.AdminService;

        import java.util.List;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 16:07 2018/1/19
 * @Modified By:
 */

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;

    //管理员登录
    public Boolean adminLogin(int id,String password) throws Exception{
        Admin admin =  adminDao.findAdminById(id);
        if(admin!=null&&admin.getAdministratorPassword().equals(password))
            return true;
        return false;
    }


    //用户管理
    public List<User> userManage() throws Exception{
        List<User> userList = adminDao.listInactiveUsers();
        return userList;
    }

//    //返回指定数量用户
//    public List<User> listBoundUsers() throws Exception{
//        List<User> userList = adminDao.listInactiveUsers();
//        return userList;
//    }

    //删除用户
    public Boolean deleteUser(int id) throws Exception{
        int influenceLine = adminDao.deleteUser(id);
        if(influenceLine == 1)
            return true;
        return false;
    }

    //企业审核页面
    public List<Company> checkCompany() throws Exception {
        List<Company> companyList = adminDao.listNotPassCompanys();
        return companyList;
    }

    //审核具体的企业
    public Boolean modifyCompanyPass(int i,int id) throws Exception{
        int influenceLine = adminDao.modifyCompanyPass(i,id);
        if(influenceLine == 1)
            return  true;
        return false;
    }

    //管理所有企业上限页面
    public List<Company> listAllCompanys() throws Exception{
        List<Company> companyList = adminDao.findAllCompanys();
        return companyList;
    }

    //修改具体的企业发布岗位上限
    public Boolean setPositionLimit(int limit,int id) throws Exception{
        int influenceLine = adminDao.setPositionLimit(limit,id);
        if(influenceLine == 1)
            return  true;
        return false;
    }

    //管理员修改密码
    public Boolean adminModifyPassword(int id,String password) throws Exception {
        int influenceLine = adminDao.adminModifyPassword(id,password);
        if(influenceLine == 1)
            return  true;
        return false;
    }
}

