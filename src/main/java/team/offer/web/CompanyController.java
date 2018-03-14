package team.offer.web;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;
import team.offer.entity.Company;
import team.offer.entity.Position;
import team.offer.entity.User;
import team.offer.service.CompanyService;
import team.offer.service.PositionService;
import team.offer.service.UserService;
import team.offer.util.JavaEmailSender;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 16:19 2018/1/19
 * @Modified By:
 */
@Controller
@RequestMapping("/company")
@SessionAttributes(value={"currCompany","verifyCodde","verifyCompany","resumeList"})
public class CompanyController {

    @Autowired
    private CompanyService companyService;

    //----------------------------------功能测试页面---------------------------//
    // 首页
    @RequestMapping("/index")
    public String index(){
        return "company/index";
    }

    //获取指定email的公司详细信息
    @RequestMapping("/getCompanyByEmail/{email}.action")
    public ModelAndView getCompany(@PathVariable("email") String email)throws Exception{
        Company company = companyService.getCompanyByEmail(email);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("company/companyDetails");
        mv.addObject("company",company);
        return mv;
    }

    //根据id获取公司的详细信息
    @RequestMapping("/getCompanyById/{id}.action")
    public ModelAndView getCompany(@PathVariable("id") int id)throws Exception{
        Company company=companyService.getCompanyById(id);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("company/companyDetails");
        mv.addObject("company",company);
        return mv;
    }

    //所有公司的详细信息
    @RequestMapping("/companysDetails.action")
    public ModelAndView getCompanyList()throws Exception{
        List<Company> companyList=companyService.getCompanyList();
        ModelAndView mv = new ModelAndView();
        mv.setViewName("company/companysDetails");
        mv.addObject("companyList",companyList);
        return mv;
    }

    //----------------------------------公司详情---------------------------//
    //成功提交
    @RequestMapping("/success.action")
    public String success(){
        return "company/company_alert";
    }


    //根据currCompany显示公司的详细信息
    @RequestMapping("/showCurrComDetails.action")
    public Object showCurrComDetails(HttpServletRequest request){
        try {
            Company currCompany= (Company) request.getSession().getAttribute("currCompany");
            Company company = companyService.getCompanyById(currCompany.getPkComId());
            request.getSession().setAttribute("currCompany",company);
            ModelAndView mv = new ModelAndView("company/company_top");
            if(currCompany!=null){
                mv.addObject("company",company);
                return mv;
                //return "company/company_top";
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/company/signCompany.action";
    }

    //完善公司详情验证
    @RequestMapping(value="completeCompany.action",method=RequestMethod.POST)
    @ResponseBody
    public Object completeCompany(Company company,HttpServletRequest request)throws Exception{
        Map<String,String> map = new HashMap<String, String>();
        int currComId= company.getPkComId();

        Company currCompany =companyService.getCompanyById(currComId);
        System.out.println("修改前"+currCompany);
        //联系方式
        //所属行业
        //公司地址
        //公司规模
        //公司简介
        String comContact = company.getComContact();
        String comIndustry = company.getComIndustry();
        String comLocation = company.getComLocation();
        String comSize = company.getComSize();
        String comIntro = company.getComIntro();
        currCompany.setComContact(comContact);
        currCompany.setComIndustry(comIndustry);
        currCompany.setComLocation(comLocation);
        currCompany.setComSize(comSize);
        currCompany.setComIntro(comIntro);
        //修改company
        companyService.completeCompany(currCompany);

        //修改验证
        Company reviseCompany = companyService.getCompanyById(currComId);

        System.out.println("修改后："+reviseCompany);

        String reviseContact = reviseCompany.getComContact();
        String reviseIndustry = reviseCompany.getComIndustry();
        String reviseLocation = reviseCompany.getComLocation();
        String reviseSize = reviseCompany.getComSize();
        String reviseIntro = reviseCompany.getComIntro();
        if(!reviseContact.equals(comContact)){
            map.put("result","ContactUpdateError");
            return map;
        }
        else if(!reviseIndustry.equals(comIndustry)){
            map.put("result","IndustryUpdateError");
            return map;
        }
        else if(!reviseLocation.equals(comLocation)){
            map.put("result","LocationUpdateError");
            return map;
        }
        else if(!reviseSize.equals(comSize)){
            map.put("result","SizeUpdateError");
            return map;
        }
        else if(!reviseIntro.equals(comIntro)){
            map.put("result","IntroUpdateError");
            return map;
        }
        else{
            request.getSession().setAttribute("currCompany",reviseCompany);
            map.put("comContact",reviseContact);
            map.put("comIndustry",reviseIndustry);
            map.put("comLocation",reviseLocation);
            map.put("comSize",reviseSize);
            map.put("comIntro",reviseIntro);
            map.put("result","completeOK");
            return map;
        }


    }
    //-------------------------------发送邮件验证------------------------//
    //发送验证码


    //----------------------------------公司注册---------------------------//
    //请求公司注册页面
    //-邮箱验证


    //邮箱验证
    @RequestMapping(value = "/sendEmail.action")
    @ResponseBody
    public Object sendEmail(HttpServletRequest request) throws Exception {
        Map<String, String> map = new HashMap<String, String>();
        String msg = "ok";
        String toEmail = request.getParameter("email");
        String requestURL = request.getParameter("request");
        //如果发送验证码请求来自 忘记密码 页面，需要验证邮箱是否存在
        System.out.println(toEmail);
        System.out.println(requestURL);
        System.out.println(companyService.getCompanyByEmail(toEmail));

        if(requestURL.equals("forgetemail")){
            Company company =companyService.getCompanyByEmail(toEmail);
            if(company==null){
                map.put("result","emailFalse");
                return map;
            }
            request.getSession().setAttribute("verifyCompany",company);
        }

        String title = "邮箱验证";
        int code= (int)(Math.random() * 999999);
        String content = "您的验证码是："+code
                + "\n验证码超过一分钟将失效";
        JavaEmailSender.sendEmail(toEmail, title, content);
        map.put("result", msg);
        //发送邮箱后，将验证码和发送邮箱时的系统时间记入session中
        request.getSession().setAttribute("code", code);
        request.getSession().setAttribute("code_time",System.currentTimeMillis());
        return map;
    }


    //公司注册后台验证
    @RequestMapping(value="/companyRegister.action",method=RequestMethod.POST)
    @ResponseBody
    public Object companyRegister(HttpServletRequest request,Integer inputCode,
                                  String confirmPassword,@Validated Company company,BindingResult result)
    {
        Map<String,Object> map= new HashMap<String,Object>();
        System.out.println("inputCode:"+inputCode);
        System.out.print("company:"+company);
        System.out.println("code:"+request.getSession().getAttribute("code"));
        //对company进行校验
        if(result.hasErrors()){
            List<ObjectError> errorList = result.getAllErrors();
            map.put("errorList",errorList);
            return map;
        }
        else{
            //验证验证码，以及验证时间是否能够超过60s
            Integer verifyCode=(Integer) request.getSession().getAttribute("code");

            if((System.currentTimeMillis()-(Long)request.getSession().getAttribute("code_time")>60000)){
                map.put("result","verifyCodeError");
                //验证码验证后，删除session中的验证码和时间
                request.getSession().removeAttribute("code");
                request.getSession().removeAttribute("code_time");
                return map;
            }
            else if(!verifyCode.equals(inputCode)){
                //数据回写
                map.put("result","verifyCodeError");
                return map;
            }

            //验证密码和确认密码是否相同
            if (!confirmPassword.equals(company.getComPassword())) {
                //数据回显
                map.put("result", "confirmError");
                return map;
            }
            try{
                //验证是否重复注册
                if (companyService.verifyComEmail(company.getComEmail())) {
                //数据回显
                    map.put("result", "registerRepeat");
                    return map;
                } else {
                //注册成功，跳转到首页
                    companyService.insertCompany(company);
                    //验证是否注册成功
                    if(companyService.verifyComEmail(company.getComEmail())){
                        map.put("result","registerOK");
                        return map;
                    }
                    else{
                        map.put("result","registerFail");
                        return map;
                    }
                }
            }
            catch (Exception e){
                e.printStackTrace();
                map.put("result","registerFail");
                return map;
            }

        }

    }



    //----------------------------------公司登录---------------------------//
    //请求公司登录页面
    @RequestMapping("/signCompany.action")
    public String companySign(){
        return "redirect:/user/loginUI.action";
    }

    //公司登录验证
    @RequestMapping(value="/companySignIn.action",method = RequestMethod.POST)
    @ResponseBody
    public Object companySignIn(String email,String password, Model model)throws Exception{
        Map<String,String> map=new HashMap<String, String>();
        Company company = companyService.getCompanyByEmail(email);
        if(company==null){
            map.put("result","NoSuchCompany");
        }
        else if(!password.equals(company.getComPassword())){
            map.put("result","passwordError");
        }else{
            if(company.getComPass()==0){
                map.put("result","NoPass");
            }
            else {
                model.addAttribute("currCompany", company);
                map.put("result", "ok");
            }
        }
        return map;
    }

    //公司登出
    @RequestMapping("/companySignOut.action")
    public String companySignOut(SessionStatus sessionStatus){
        sessionStatus.setComplete();
        return "redirect:/user/loginUI.action";
    }


    //----------------------------------修改密码---------------------------//
    //请求密码修改页面
    @RequestMapping("/changeComPassword.action")
    public String changePassword() {

        return "company/company_password";
    }

    //修改密码异步验证
    @RequestMapping(value="/updateCompany.action",method= RequestMethod.POST)
    @ResponseBody
    public Object updateCompany
    (String oldpass,String newpass,String newpassConfirm,@ModelAttribute("currCompany")Company company)
            throws Exception{
        Map<String,String> map= new HashMap<String,String >();
        System.out.print(oldpass);
        System.out.print(company);
        if(!company.getComPassword().equals(oldpass)){
            map.put("result","oldPassError");
            return map;
        }
        else if(!newpass.equals(newpassConfirm)){
            map.put("result","newPassConfirmError");
            return map;
        }
        else{
            company.setComPassword(newpass);
            companyService.updateCompany(company);
            String afterpass =companyService.getCompanyByEmail(company.getComEmail()).getComPassword();
            System.out.println("afterpass"+afterpass);
            if(!afterpass.equals(newpass)){
                map.put("result","changePassWordError");
                return map;
            }
            else{
                map.put("result","changePasswordSuccess");
                return map;
            }
        }
    }

    //--------------------------------------找回密码-------------------------------------//
    //请求找回密码页面
    @RequestMapping("/findComPassword.action")
    public String findComPassword(){
        return "company/company_forgetmail";
    }

    //验证成功跳转修改密码，不成功返回
    @RequestMapping(value="/verifyVerifyCode.action",method=RequestMethod.POST)
    public String verifyVerifyCode(@RequestParam("inputCode")int inputCode,HttpSession session)
    {
        Integer verifyCode= (Integer)session.getAttribute("code");
        //时间验证
        if((System.currentTimeMillis()-(Long)session.getAttribute("code_time")>60000)) {
            session.removeAttribute("code");
            session.removeAttribute("code_time");
            return "redirect:company/findComPassword.action";
        }
        else if(!verifyCode.equals(inputCode)) {
            return "redirect:company/findComPassword.action";
        }
        else{
            return "company/company_forgetpassword";
        }
    }

    //忘记密码修改密码
    @RequestMapping(value = "/findChangePassword.action",method = RequestMethod.POST)
    public Object findChangePassword(HttpSession session,@RequestParam("password") String password,@RequestParam("passwordConfirm") String passwordConfirm)
    throws Exception{
        Company company=(Company) session.getAttribute("verifyCompany");
        if(password.equals(passwordConfirm)){
            company.setComPassword(password);
            companyService.updateCompany(company);
            session.removeAttribute("verifyCompany");
            return "redirect:/user/loginUI.action";
        }
        return "company/company_forgetpassword";
    }



    //----------------------------------职位信息发布---------------------------//
    //职位信息显示
    @RequestMapping("/showPositions.action")
    public ModelAndView showPositions(@RequestParam(required=false)Integer page,@ModelAttribute("currCompany")Company currCompany)
    throws Exception{
        System.out.println(currCompany);

        ModelAndView mv = new ModelAndView("company/company_job");
        page=page==null?1:page;
        PageHelper.startPage(page,4);
        int comId=currCompany.getPkComId();
        List<Position> positionList = companyService.queryPositionByComId(comId);
        PageInfo<Position> positionPageInfo=new PageInfo<Position>(positionList);
        mv.addObject("positionPageInfo",positionPageInfo);
        mv.addObject("positionList",positionList);
        return mv;
    }

    //职位信息发布页面请求
    @RequestMapping("/postPositionPageRequest.action")
    public ModelAndView postPositionPage(@ModelAttribute("currCompany")Company company){
        ModelAndView mv= new ModelAndView("company/company_post");
        return mv;
    }


    //职位信息发布
    @RequestMapping(value="/postPosition.action",method=RequestMethod.POST)
    @ResponseBody
    public Object postPosition(@ModelAttribute("position") Position position,Integer comId){
        Map<String,String> map= new HashMap<String, String>();
        try {
            position.setComId(comId);//设定职位对应的公司id
            System.out.print(position);
            companyService.insertPosition(position);
            System.out.println("pkPositionId"+position.getPkPositionId());
            //发布后利用主键回填
            if(position.getPkPositionId()!=null){
                map.put("result","postOK");
            }
            else{
                map.put("result","postFail");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    //职位信息删除
    @RequestMapping(value="/deletePositionById.action")
    public String deletePositionById(@RequestParam("pkPositionId")int pkPositionId) {
        try {
            companyService.deletePosition(pkPositionId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:./showPositions.action";
    }

    //----------------------------------简历管理---------------------------//
    //简历管理
    @RequestMapping("/showResumes.action")
    public ModelAndView showResumes(@RequestParam(required=false)Integer page,@ModelAttribute("currCompany")Company currCompany){
        ModelAndView mv= new ModelAndView("company/company_res_position");
        page=page==null?1:page;
        PageHelper.startPage(page,4);
        int comId = currCompany.getPkComId();
        List<Position> positionList = null;
        try {
            positionList = companyService.queryPositionByComId(comId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        PageInfo<Position> positionPageInfo = new PageInfo<Position>(positionList);
        mv.addObject("positionList",positionList);
        mv.addObject("positionPageInfo",positionPageInfo);
        return mv;
    }


    //简历查看
    @RequestMapping(value="/showResumesByPositionId.action")
    public ModelAndView showResumesByPositionId(@RequestParam("pkPositionId")Integer pkPositionId,
                                                @RequestParam(required = false)Integer page,HttpSession session)throws Exception{
        page=page==null?1:page;
        PageHelper.startPage(page,3);
        //将当前被选中的positionID存到session
        if(session.getAttribute("pkPositionId")!=null){
            session.removeAttribute("pkPositionId");
        }
        session.setAttribute("pkPositionId",pkPositionId);
        ModelAndView mv= new ModelAndView("company/company_res_ope");

        List<User> userList = companyService.getResumes(pkPositionId);
        PageInfo<User> userPageInfo= new PageInfo<User>(userList);
        mv.addObject("userPageInfo",userPageInfo);
        mv.addObject("userList",userList);
        mv.addObject("pkPositionId",pkPositionId);
        return mv;
    }

    //简历详细页面展示
    @RequestMapping("/showResumeDetails.action")
    public ModelAndView showResumeDetails(@RequestParam("userId")Integer userId
        )throws Exception{
            ModelAndView mv = new ModelAndView("company/company_res_operation");
            User user= companyService.getResumeDetails(userId);
            mv.addObject("user",user);
        return mv;
    }

    //简历接受
    @RequestMapping(value="/acceptResume.action",method= RequestMethod.POST,produces="application/json;charset=UTF-8")
    @ResponseBody
    public Object acceptResume(Integer userId,HttpSession session){
        int pkPositionId =(Integer) session.getAttribute("pkPositionId");
        System.out.print(pkPositionId);
        Map<String,String> map= new HashMap<String,String>();
        try {
            companyService.passResume(userId,pkPositionId);
            //修改简历状态后验证
            int status = companyService.getApplicationStatusById(userId,pkPositionId);
            if(status==1){
                map.put("result","acceptResumeOK");
            }
            else{
                map.put("result","acceptResumeFail");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    //简历拒绝
    @RequestMapping(value="/refuseResume.action",method= RequestMethod.POST)
    @ResponseBody
    public Object refuseResume(Integer userId,HttpSession session){
        Map<String,String> map= new HashMap<String,String>();
        int pkPositionId =(Integer) session.getAttribute("pkPositionId");
        System.out.print(pkPositionId);
        try {
            //修改简历状态后验证
            companyService.refuseResume(userId,pkPositionId);
            int status = companyService.getApplicationStatusById(userId,pkPositionId);
            System.out.println(status);
            if(status==-1){
                map.put("result","refuseResumeOK");
            }
            else{
                map.put("result","refuseResumeFail");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }


}
