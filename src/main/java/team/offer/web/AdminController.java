package team.offer.web;

import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import team.offer.entity.Admin;
import team.offer.entity.Company;
import team.offer.entity.User;

import javax.jws.WebParam;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import team.offer.service.AdminService;
import javax.servlet.http.HttpSession;
/**
 * @Author:xuan
 * @Description:管理员相关控制器
 * @Date:Created in 16:21 2018/1/19
 * @Modified By:xuan
 */
@Controller
@RequestMapping("/admin")
@SessionAttributes(value={"curAdmin","message"})
public class AdminController {

    @Autowired
    private AdminService adminService;

    //登录
    @RequestMapping("/adminLoginPage.action")
    public String adminLoginPage(Model model) throws Exception {
        String message = "n";
        model.addAttribute("message",message);
        return "admin/adminLogin";
    }

    //登录
    @RequestMapping(value = "/adminLogin.action", method = RequestMethod.POST)
    public ModelAndView adminLogin(HttpSession httpSession,@RequestParam("id") int id, @RequestParam("password") String password, Model model) throws Exception {
        Boolean b = adminService.adminLogin(id, password);
        ModelAndView mv = new ModelAndView();
        Admin admin = new Admin();
        String message = null;
        admin.setPkAdministrator_name(id);
        admin.setAdministratorPassword(password);
        if (b) {
            model.addAttribute("curAdmin", admin);
            message="n";
            httpSession.setAttribute("message",message);
            mv.setViewName("redirect:/admin/userManage.action?page=1");
            return mv;
        }
        message = "您输入的用户名或者密码错误";
        mv.addObject("message",message);
        mv.setViewName("admin/adminLogin");
        return mv;
    }

    //用户管理
    @RequestMapping("/userManage.action")
    public ModelAndView userManage(HttpSession httpSession,@RequestParam("page") int p,Model model) throws Exception {
        //获得当前session中的admin，如果为null，表示未登录，跳到登陆页面。
        Admin admin = (Admin) httpSession.getAttribute("curAdmin");
        ModelAndView mv = new ModelAndView();
//        String message = null;
        if (admin != null) {
            //定义userList来接收服务层传回的user集合
            List<User> userList = adminService.userManage();
            int page;

            //用户总数
            int totalUsers = userList.size();

            //每页用户数
            int usersPerPage = 3;
            //总页数
            int totalPages = totalUsers % usersPerPage == 0 ? totalUsers / usersPerPage : totalUsers / usersPerPage + 1;

            //判断返回的page是否正确
            if(p>totalPages)
                page=p-1;
            else
                page=p;

            //本页起始用户序号
            int beginIndex = (page - 1) * usersPerPage;
            //本页末尾用户序号的下一个
            int endIndex = beginIndex + usersPerPage;
            if (endIndex > totalUsers)
                endIndex = totalUsers;
            mv.addObject("totalUsers", totalUsers);
            mv.addObject("usersPerPage", usersPerPage);
            mv.addObject("totalPages", totalPages);
            mv.addObject("beginIndex", beginIndex);
            mv.addObject("endIndex", endIndex);
            mv.addObject("page", page);
            mv.addObject("userList", userList);

            mv.setViewName("admin/userManage");
            return mv;
        } else{
            mv.setViewName("redirect:/admin/adminLoginPage.action");
            return mv;
        }

    }

    //删除用户
    @RequestMapping("/deleteUser.action")
    public ModelAndView deleteUser(HttpSession httpSession,@RequestParam("id") int id,@RequestParam("page") int page) throws Exception {
        Boolean b = adminService.deleteUser(id);
//        这里可以放删除以后的逻辑，根据返回值，给管理员提示信息
//        if (b)
//            System.out.println("删除成功");
//        else
//            System.out.println("删除失败");

        ModelAndView mv = new ModelAndView();
//        String message = null;
//        message = "删除成功";
//        httpSession.setAttribute("message",message);
//        mv.addObject("message",message);
        mv.setViewName("redirect:/admin/userManage.action?page="+String.valueOf(page));
        return mv;
    }

    //企业审核
    @RequestMapping("/checkCompany.action")
    public ModelAndView checkCompany(HttpSession httpSession,@RequestParam("page") int p,Model model) throws Exception {
        Admin admin = (Admin) httpSession.getAttribute("curAdmin");
        ModelAndView mv = new ModelAndView();
//        String message = (String)httpSession.getAttribute("message");
        if (admin != null) {
            List<Company> companyList = adminService.checkCompany();
            int page;

            //用户总数
            int totalComs = companyList.size();

            //每页用户数
            int comsPerPage = 3;
            //总页数
            int totalPages = totalComs % comsPerPage == 0 ? totalComs / comsPerPage : totalComs / comsPerPage + 1;

            //判断返回的page是否正确
            if(p>totalPages)
                page=p-1;
            else
                page=p;

            //本页起始用户序号
            int beginIndex = (page - 1) * comsPerPage;
            //本页末尾用户序号的下一个
            int endIndex = beginIndex + comsPerPage;
            if (endIndex > totalComs)
                endIndex = totalComs;
            mv.addObject("totalComs", totalComs);
            mv.addObject("comsPerPage", comsPerPage);
            mv.addObject("totalPages", totalPages);
            mv.addObject("beginIndex", beginIndex);
            mv.addObject("endIndex", endIndex);
            mv.addObject("page", page);
//            mv.addObject("message",message);
            mv.setViewName("admin/checkCompany");
            mv.addObject("companyList", companyList);
//            message = "n";
//            httpSession.setAttribute("message",message);
            return mv;
        } else {
            mv.setViewName("redirect:/admin/adminLoginPage.action");
            return mv;
        }
    }

    //修改企业的注册状态
    @RequestMapping("/modifyCompanyPass.action")
    public ModelAndView modifyCompanyPass(@RequestParam("id") int id, @RequestParam("value") int value,@RequestParam("page") int page) throws Exception {
        Boolean b = adminService.modifyCompanyPass(value, id);
//        这里可以放修改以后的逻辑，根据返回值，给管理员提示信息
//        if (b)
//            System.out.println("修改成功");
//        else
//            System.out.println("修改失败");
//        String message = null;
        ModelAndView mv = new ModelAndView();
//        message = "修改成功";
//        mv.addObject("message",message);
        mv.setViewName("redirect:/admin/checkCompany.action?page="+String.valueOf(page));
        return mv;
    }

    //企业发布岗位上限管理页面
    @RequestMapping("/positionLimitManage.action")
    public ModelAndView positionLimitManage(HttpServletRequest httpServletRequest,HttpSession httpSession,@RequestParam("page") int p,Model model) throws Exception {
        Admin admin = (Admin) httpSession.getAttribute("curAdmin");
        ModelAndView mv = new ModelAndView();
        String message = (String)httpSession.getAttribute("message");
        if (admin != null) {
            List<Company> companyList = adminService.listAllCompanys();
            int page;
            //用户总数
            int totalComs = companyList.size();

            //每页用户数
            int comsPerPage = 3;
            //总页数
            int totalPages = totalComs % comsPerPage == 0 ? totalComs / comsPerPage : totalComs / comsPerPage + 1;
            //当前页数
            page=p;

            //本页起始用户序号
            int beginIndex = (page - 1) * comsPerPage;
            //本页末尾用户序号的下一个
            int endIndex = beginIndex + comsPerPage;
            if (endIndex > totalComs)
                endIndex = totalComs;
            mv.addObject("totalComs", totalComs);
            mv.addObject("comsPerPage", comsPerPage);
            mv.addObject("totalPages", totalPages);
            mv.addObject("beginIndex", beginIndex);
            mv.addObject("endIndex", endIndex);
            mv.addObject("page", page);
            mv.addObject("message", message);
            mv.setViewName("admin/positionLimitManage");
            mv.addObject("companyList", companyList);
            return mv;
        } else {
            mv.setViewName("redirect:/admin/adminLoginPage.action");
            return mv;
        }
    }

    //修改企业发布岗位上限
    @RequestMapping(value = "/setPositionLimit.action", produces = "application/json;charset=UTF-8")
    public ModelAndView setPositionLimit(HttpSession httpSession,@RequestParam("id") int id, @RequestParam("limit") int value,@RequestParam("page") int page) throws Exception {
//        String message = null;
        ModelAndView mv = new ModelAndView();
//        if(!"".equals(String.valueOf(value))&&value>5&&value<100) {
            Boolean b = adminService.setPositionLimit(value, id);
//      这里可以放修改企业发布岗位上限以后的以后的逻辑，根据返回值，给管理员提示信息
//            message = "设置成功";
//        }
//        else
//        {
//            message = "请输入有效的上限数(6~99)";
//        }
//        httpSession.setAttribute("message",message);
//        System.out.println((String)httpSession.getAttribute("message"));
        mv.setViewName("redirect:/admin/positionLimitManage.action?page="+String.valueOf(page));
        return mv;
    }
    //管理员修改密码页面
    @RequestMapping("/adminModifyPasswordPage.action")
    public ModelAndView adminModifyPasswordPage(HttpSession httpSession) {
        Admin admin = (Admin) httpSession.getAttribute("curAdmin");
        String message ="n";
        ModelAndView mv = new ModelAndView();
        mv.addObject("message",message);
        if (admin != null) {
            mv.setViewName("admin/adminModifyPasswordPage");
        }
        else
            mv.setViewName("redirect:/admin/adminLoginPage.action");
        return mv;
    }

    //管理员修改密码操作
    @RequestMapping(value = "/adminModifyPassword.action", method = RequestMethod.POST)
    public ModelAndView adminModifyPassword(@RequestParam("password") String password,
                                      @RequestParam("oldPassword") String oldPassword,
                                      @RequestParam("comfirmPassword") String confirmPassword,
                                      HttpSession httpSession) throws Exception {
        Admin admin = (Admin) httpSession.getAttribute("curAdmin");
        ModelAndView mv = new ModelAndView();
        String message = null;
        if (password.trim().equals(confirmPassword.trim()) && !"".equals(password.trim())) {
            Boolean b1 = adminService.adminLogin(admin.getPkAdministrator_name(), oldPassword);
            if(b1)
            {
                Boolean b2 = adminService.adminModifyPassword(admin.getPkAdministrator_name(), password);
                message = "修改成功";
            }
            else
            {
                message = "请输入正确的原密码";
            }
        }
        else
        {
            message ="请输入一致的新密码和确认密码，而且不要输入空密码";
        }
        //两次输入的密码不一样，或者密码都为空
        mv.setViewName("admin/adminModifyPasswordPage");
        mv.addObject("message",message);
        return mv;
    }


    //管理员退出
    @RequestMapping("/exit.action")
    public String exit(HttpSession httpSession) throws Exception{
        Admin admin = (Admin) httpSession.getAttribute("curAdmin");
        if(admin != null)
        {
            httpSession.removeAttribute("curAdmin");
        }
        return "redirect:/admin/adminLoginPage.action";
    }
}