package team.offer.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import team.offer.entity.User;
import team.offer.service.UserService;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 19:30 2018/1/18
 * @Modified By:
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;

    //获取用户个人信息
    @RequestMapping("/detail.action")
    public String getUserDetail(Model model, HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        Integer userId = Integer.parseInt(id);
        User user = userService.findUserById(userId);
        model.addAttribute("user",user);
        return "userdetail";

    }

    //注册
    @RequestMapping("/register.action")
    public String register (Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //登录
    @RequestMapping("/login.action")
    public String login(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //忘记密码
    @RequestMapping("/forget.action")
    public String forget(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //修改密码
    @RequestMapping("/updatePassword.action")
    public String updatePassword(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //验证注册验证码
    @RequestMapping("/verify.action")
    public String verifyEmailCode(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //查看收藏的岗位
    @RequestMapping("/queryCollection.action")
    public String queryCollection(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //删除收藏的岗位
    @RequestMapping("/deleteCollection.action")
    public String deleteCollection(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //查看新投递
    @RequestMapping("/newApplication.action")
    public String newApplication(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //查看已查阅
    @RequestMapping("/consulted.action")
    public String consulted(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //查看待安排
    @RequestMapping("/arranged.action")
    public String arranged(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //投递职位
    @RequestMapping("/deliver.action")
    public String deliver(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //收藏职位
    @RequestMapping("/collection.action")
    public String collection(Model model,HttpServletRequest request) throws Exception{
        return null;
    }

    //发送注册验证码
    @RequestMapping("/sendRegisterEmail.action")
    public void sendEmailCode(Model model,HttpServletRequest request) throws Exception{

    }



}
