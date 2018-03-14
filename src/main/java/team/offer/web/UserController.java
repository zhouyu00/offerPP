package team.offer.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import team.offer.entity.*;
import team.offer.service.PositionService;
import team.offer.service.UserService;
import team.offer.util.JavaEmailSender;
import team.offer.util.MD5Util;


import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Resource
    private PositionService positionService;

    //--------------------------------------------注册-------------------------------------------//
    //跳转注册页面
    @RequestMapping(value = "/registerUI.action", method = {RequestMethod.GET})
    public String registerUI(HttpServletRequest request) throws Exception {
        return "user/register";
    }



    //发送验证码
    @RequestMapping(value = "/sendEmail.action", produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object sendEmail(HttpServletRequest request) throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        String msg = "ok";
        String toEmail = request.getParameter("email");
        String requestURL = request.getParameter("request");
        //如果发送验证码请求来自 忘记密码 页面，需要验证邮箱是否存在
        if(requestURL!=null&&!userService.verifyEmail(toEmail)){
            map.put("result","emailFalse");
            return map;
        }
        String title = "offer++注册验证码";
        String content = "您的验证码是："+(int) (Math.random() * 999999) + ""
                + "\n验证码超过一分钟将失效";

        JavaEmailSender.sendEmail(toEmail, title, content);
        map.put("result", msg);
        //发送邮箱后，将验证码和发送邮箱时的系统时间记入session中
        request.getSession().setAttribute("code", content);
        request.getSession().setAttribute("code_time",System.currentTimeMillis());
        return map;
    }

    //注册
    @RequestMapping(value = "/register.action", method = {RequestMethod.POST})
    public String register(Model model, String inputCode, HttpServletRequest request, @Validated User user, BindingResult result) throws Exception {
        String confirmPassword = request.getParameter("confirmPassword");
        String code = request.getParameter("inputCode");
        //对邮箱和密码进行数据检验
        if (result.hasErrors()) {
            //如果参数绑定出错，获取所有错误
            List<ObjectError> errors = result.getAllErrors();
            model.addAttribute("errors", errors);
            //数据回显
            model.addAttribute("register_user", user);
            model.addAttribute("inputCode", inputCode);
            return "user/register";
        } else {
            //验证验证码，以及验证时间是否超过60s
            String registerCode = (String) request.getSession().getAttribute("code");
            if ((!registerCode.equals(code))||(System.currentTimeMillis()-(Long)request.getSession().getAttribute("code_time")>60000)) {
                //数据回显
                model.addAttribute("register_user", user);
                model.addAttribute("inputCode", inputCode);
                model.addAttribute("codeError", "验证码错误");
                return "user/register";
            }
            //验证码验证后，删除session中的验证码和时间
            request.getSession().removeAttribute("code");
            request.getSession().removeAttribute("code_time");
            //验证密码和确认密码是否相同
            if (!confirmPassword.equals(user.getUserPassword())) {
                //数据回显
                model.addAttribute("register_user", user);
                model.addAttribute("inputCode", inputCode);
                model.addAttribute("confirmError", "确认密码和密码不同");
                return "user/register";
            }
            //验证是否重复注册
            if (!userService.register(user)) {
                //数据回显
                model.addAttribute("register_user", user);
                model.addAttribute("inputCode", inputCode);
                model.addAttribute("repeatEmail", "邮箱重复注册");
                return "user/register";
            } else {
                //注册成功，跳转到首页
                //将user加入到session中
                return "redirect:/user/loginUI.action";
            }
        }

    }

    //--------------------------------------------登录-------------------------------------------//
    //跳转登录页面
    @RequestMapping(value = "/loginUI.action", method = {RequestMethod.GET})
    public String loginUI(Model model, HttpServletRequest request) throws Exception {
        //判断cookie中是否有loginInfo，如果有则是记住我状态
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("loginInfo")) {
                String[] loginInfo = cookie.getValue().split(",");
                model.addAttribute("email", loginInfo[0]);
                model.addAttribute("password", loginInfo[1]);
                model.addAttribute("remember", 1);
            }

            if (cookie.getName().equals("comLoginInfo")) {
                String[] loginInfo = cookie.getValue().split("#");
                model.addAttribute("comEmail", loginInfo[0]);
                model.addAttribute("comPassword", loginInfo[1]);
                model.addAttribute("comRemCheck", 1);
                System.out.println("cookies"+cookie);
            }
        }
        return "user/login";
    }

    //登录
    @RequestMapping(value = "/login.action", method = {RequestMethod.POST})
    public String login(Model model, User user, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String remember = request.getParameter("remember");
        String password = user.getUserPassword();
        //如果登录验证通过
        if (userService.login(user)) {
            //将user加入到session中
            User currentUser = userService.findUserByEmail(user.getUserEmail());
            request.getSession().setAttribute("user", currentUser);
            //如果勾选记住我，将user保存到cookie
            if (!(remember == null || remember.equals(""))) {
                Cookie userCookie = new Cookie("loginInfo", user.getUserEmail() + "," + password);
                userCookie.setMaxAge(30 * 24 * 60 * 60);
                userCookie.setPath("/");
                response.addCookie(userCookie);

            }
            //取消勾选记住我，删除cookie
            else {
                Cookie[] cookies = request.getCookies();
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("loginInfo")) {
                        cookie.setMaxAge(0);
                        cookie.setPath("/");
                        response.addCookie(cookie);



                    }
                }
            }
            User loginUser = (User)request.getSession().getAttribute("user");
            model.addAttribute("user",loginUser);
            //跳转到首页
            return "redirect:/user/indexUI.action";

        } else {
            model.addAttribute("user", user);
            model.addAttribute("error", "用户名或密码错误");
            return "user/login";
        }
    }

    //--------------------------------------------忘记密码-------------------------------------------//
    //跳转到忘记密码邮箱验证页面
    @RequestMapping(value = "/forgetEmailUI.action", method = {RequestMethod.GET})
    public String forgetUI(Model model, HttpServletRequest request) throws Exception {
        return "user/forgetemail";
    }

    //忘记密码——邮箱验证
    @RequestMapping("/forgetEmail.action")
    public String forgetEmail(Model model, String email, String inputCode, HttpServletRequest request) throws Exception {
        //验证验证码是否正确
        String code = (String) request.getSession().getAttribute("code");
        if(!userService.verifyEmail(email)){
            model.addAttribute("email", email);
            model.addAttribute("inputCode", inputCode);
            model.addAttribute("error","邮箱错误，请重新输入");
            return "user/forgetemail";
        }
        //如果验证码正确并且验证时间没超过60s，验证成功并跳转到修改密码页面
        if (inputCode.equals(code)&&(System.currentTimeMillis()-(Long)request.getSession().getAttribute("code_time")<60000)) {
            model.addAttribute("email",email);
            request.getSession().removeAttribute("code");
            request.getSession().removeAttribute("code_time");
            return "user/forgetpassword";
        }
        //错误，数据回显
        else {
            model.addAttribute("email", email);
            model.addAttribute("inputCode", inputCode);
            model.addAttribute("codeError","验证码错误");
            return "user/forgetemail";
        }
    }

    //忘记密码——修改密码
    @RequestMapping("/forgetPassword.action")
    public String forgetPassword(Model model, String confirmPassword, HttpServletRequest request, @Validated UserValidation user, BindingResult result) throws Exception {
        User loginUser = (User)request.getSession().getAttribute("user");
        model.addAttribute("user",loginUser);
        //对密码进行数据校验
        if (result.hasErrors()) {
            //获取错误信息，数据回显
            List<ObjectError> errors = result.getAllErrors();
            model.addAttribute("errors", errors);
            model.addAttribute("password", user.getUserPassword());
            model.addAttribute("confirmPassword", confirmPassword);

            return "user/forgetpassword";
        } else {
            try {
                //如果确认密码与密码不同，返回错误
                if (!confirmPassword.equals(user.getUserPassword())) {
                    model.addAttribute("password", user.getUserPassword());
                    model.addAttribute("confirmPassword", confirmPassword);
                    model.addAttribute("confirmError", "确认密码与密码不一致");
                    return "user/forgetpassword";
                }
                String email = request.getParameter("email");
                //修改密码成功，返回登录页面
                userService.forgetPassword(email, user.getUserPassword());
                return "user/login";
            }catch(Exception ex){
                model.addAttribute("password", user.getUserPassword());
                model.addAttribute("confirmPassword", confirmPassword);
                model.addAttribute("error", "密码修改失败");
                return "user/forgetpassword";
            }
        }
    }

    //--------------------------------------------首页-------------------------------------------//

    //跳转到首页
    @RequestMapping(value="/indexUI.action")
    public String indexUI(Model model,HttpServletRequest request) throws Exception{

        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        List<PositionQuery> positionQueries = positionService.queryPosition(uid);
        User user = userService.findUserById(uid);
        for(PositionQuery positionQuery:positionQueries){
            String[] skills = positionQuery.getPositionSkill().split(";");
            positionQuery.setSkills(skills);
        }
        model.addAttribute("positionQueries",positionQueries);
        model.addAttribute("user",user);
        return "user/index";
    }

    //--------------------------------------------修改密码-------------------------------------------//
    //跳转到修改密码页面
    @RequestMapping(value="/changePasswordUI.action",method={RequestMethod.GET})
    public String changePasswordUI(Model model,HttpServletRequest request) throws Exception{
        return "user/changepassword";
    }

    //修改密码
    @RequestMapping("/changePassword.action")
    public String changePassword(Model model, HttpServletRequest request, @Validated UserValidation user, BindingResult result) throws Exception {
        //将需要回显的数据保存到str中
        Map<String,String> str = new HashMap<String,String>();
        String oldPassword = request.getParameter("oldPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");
        str.put("oldPassword",oldPassword);
        str.put("newPassword",user.getUserPassword());
        str.put("confirmNewPassword",confirmNewPassword);
        User loginUser = (User)request.getSession().getAttribute("user");
        model.addAttribute("user",loginUser);
        //如果数据校验有误，数据回显
        if(result.hasErrors()){
            List<ObjectError> errors = result.getAllErrors();
            model.addAttribute("errors",errors);
            model.addAttribute("data",str);
            return "user/changepassword";
        }else{
            //如果新密码与确认密码不一致，数据回显
            if(!user.getUserPassword().equals(confirmNewPassword)){
                model.addAttribute("data",str);
                model.addAttribute("confirmError","新密码与确认密码不同");
                return "user/changepassword";
            }
            //验证旧密码是否正确，不正确回显
            if(!userService.changePassword(loginUser,oldPassword,user.getUserPassword())){
                model.addAttribute("data",str);
                model.addAttribute("oldError","旧密码错误，请重新输入");
                return "user/changepassword";
            }else{
                //旧密码正确，修改密码
                model.addAttribute("result","修改密码成功");
                loginUser.setUserPassword(MD5Util.MD5(user.getUserPassword()));
                request.getSession().setAttribute("user",loginUser);
                return "user/changepassword";
            }
        }

    }

    //--------------------------------------------我的投递模块-------------------------------------------//


    //查看新投递
    @RequestMapping("/newApplication.action")
    public String newApplication(Model model, HttpServletRequest request) throws Exception {
        //获取登录用户的id
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        //查询用户新投递的职位，并返回
        List<PositionVo> positionVos = userService.newApplication(uid);
        for(PositionVo positionVo:positionVos){
            String[] skills = positionVo.getPosition().getPositionSkill().split(";");
            positionVo.setSkills(skills);
        }
        model.addAttribute("positionVos",positionVos);
        model.addAttribute("user",loginUser);
        return "user/mydeliver_new";
    }


    //查看被回绝
    @RequestMapping("/consultedApplication.action")
    public String consultedApplication(Model model, HttpServletRequest request) throws Exception {
        //获取登录用户的id
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        //查询用户以被查询的职位，并返回
        List<PositionVo> positionVos = userService.consultedApplication(uid);
        for(PositionVo positionVo:positionVos){
            String[] skills = positionVo.getPosition().getPositionSkill().split(";");
            positionVo.setSkills(skills);
        }
        model.addAttribute("user",loginUser);
        model.addAttribute("positionVos",positionVos);
        return "user/mydeliver_refered";
    }


    //查看待安排
    @RequestMapping("/arrangedApplication.action")
    public String arrangedApplication(Model model, HttpServletRequest request) throws Exception {
        //获取登录用户的id
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        //查询用户待安排的职位，并返回
        List<PositionVo> positionVos = userService.arrangedApplication(uid);
        for(PositionVo positionVo:positionVos){
            String[] skills = positionVo.getPosition().getPositionSkill().split(";");
            positionVo.setSkills(skills);
        }
        model.addAttribute("user",loginUser);
        model.addAttribute("positionVos",positionVos);
        return "user/mydeliver_interview";
    }

    //--------------------------------------------我的收藏模块-------------------------------------------//

    //查看收藏的岗位
    @RequestMapping("/myCollection.action")
    public String myCollection(Model model, HttpServletRequest request) throws Exception {
        //获取登录用户的id
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        //查询用户收藏的职位，并返回
        List<PositionVo> positionVos = userService.queryCollection(uid);
        for(PositionVo positionVo:positionVos){
            String[] skills = positionVo.getPosition().getPositionSkill().split(";");
            positionVo.setSkills(skills);
        }
        model.addAttribute("user",loginUser);
        model.addAttribute("positionVos",positionVos);
        return "user/mycollection";
    }

    //添加收藏的岗位
    @RequestMapping(value="/addCollection.action",produces="application/json;charset=UTF-8")
    @ResponseBody
    public Object addCollection(Model model,Integer pid,HttpServletRequest request) throws Exception{
        Map<String,String> result = new HashMap<String,String>();
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        //如果用户收藏职位成功，返回1
        try {
            if (userService.collectionPosition(uid, pid)) {
                result.put("result", "1");
                return result;
            }
            //用户收藏职位失败，返回0
            else {
                result.put("reuslt", "0");
                return result;
            }
        }catch(Exception e){
            result.put("result","0");
            return result;
        }
    }

    //删除收藏的岗位
    @RequestMapping(value="/deleteCollection.action",produces="application/json;charset=UTF-8")
    @ResponseBody
    public Object deleteCollection(Model model, Integer pid,HttpServletRequest request) throws Exception {
        Map<String,String> result = new HashMap<String,String>();
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        //如果用户删除收藏职位成功，返回1
        try {
            if (userService.deleteCollection(uid, pid)) {
                result.put("result", "1");
                return result;
            }
            //用户删除收藏职位失败，返回0
            else {
                result.put("reuslt", "0");
                return result;
            }
        }catch(Exception e){
            result.put("result","0");
            return result;
        }
    }

    //--------------------------------------------职位搜索模块-------------------------------------------//

    //投递职位
    @RequestMapping(value="/deliver.action",produces="application/json;charset=UTF-8")
    @ResponseBody
    public Object deliver(Model model, HttpServletRequest request,Integer pid) throws Exception {
        Map<String,String> result = new HashMap<String,String>();
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        //如果用户投递职位成功，返回1
        try {
            if (userService.deliverPosition(uid, pid)) {
                result.put("result", "1");
                return result;
            }
            //用户收藏职位失败，返回0
            else {
                result.put("reuslt", "0");
                return result;
            }
        }catch(Exception e){
            result.put("result","0");
            return result;
        }
    }

    //--------------------------------------------退出登录-------------------------------------------//

    @RequestMapping(value="logout.action")
    public String logout(Model model,HttpServletRequest request) throws Exception{
        request.getSession().removeAttribute("user");
        return "redirect:/user/loginUI.action";
    }


}
