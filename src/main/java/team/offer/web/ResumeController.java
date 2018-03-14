package team.offer.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import team.offer.entity.User;
import team.offer.service.ResumeService;
import team.offer.service.impl.ResumeServiceImpl;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2018/3/5.
 */
@Controller
@RequestMapping("/resume")
public class ResumeController {

    @Autowired
    private ResumeService resumeService;

    //首页
    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    //获取指定id的用户简历
    @RequestMapping("/getResume.action")
    public String getUserDetail(Model model, HttpServletRequest request) throws Exception {
        User per = (User) request.getSession().getAttribute("user");
        int id = per.getPkUserId();
        User user = resumeService.queryResumeInformation(id);
        model.addAttribute("resume", user);

        return "resume/resume";
    }

    //获取指定id的用户个人信息
    @RequestMapping("/getPersonal.action")
    public String getPersonal(Model model, HttpServletRequest request, HttpSession session) throws Exception {

        User per = (User) request.getSession().getAttribute("user");
        int id = per.getPkUserId();

        User user = resumeService.getPersonalInformation(id);
        String result = (String)request.getAttribute("result");
        if(result=="ok"){
            model.addAttribute("result","ok");
        }
        model.addAttribute("personalInformation", user);

        return "resume/personalInfor";
        //return null;
    }

    //修改指定id的用户个人信息
    @RequestMapping("/setPersonal.action")
    public String setPersonal(User user, HttpServletRequest request, @RequestParam(value = "userUpload", required = false) MultipartFile userUpload) throws Exception {
        User per = (User) request.getSession().getAttribute("user");
        int id = per.getPkUserId();
        user.setPkUserId(id);
        if (!userUpload.isEmpty()) {
            //随机生成文件名
            String name = UUID.randomUUID().toString().replaceAll("-", "");
            //原文件名
            String oriName = userUpload.getOriginalFilename();
            //后缀
            String extName = oriName.substring(oriName.lastIndexOf("."));
            System.out.println("username=" + oriName);
            System.out.println("username=" + extName);
            //userUpload.transferTo(new File("/upload/" + name + extName));
            userUpload.transferTo(new File("C:/Git/pictures/" + name + extName));
            user.setUserIcon(name + extName);
            System.out.println("username=" + user.getUserIcon());
        } else {
            user.setUserIcon(resumeService.getPersonalDescription(id).getUserIcon());
        }
        resumeService.setPersonalInformation(user);
        request.setAttribute("result","ok");
        return "forward:/resume/getPersonal.action";
    }


    //获取指定id的技能信息
    @RequestMapping("/getSkills.action")
    public String getSkills(Model model, HttpServletRequest request) throws Exception {
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer userId = loginUser.getPkUserId();
        User user = resumeService.getSkillsInformation(userId);
        String Station = user.getUserStation();
        Station = Station + ", ";

        String[] Stations = Station.split(",");

        request.setAttribute("Stations", Stations);
        String result = (String)request.getAttribute("result");
        if(result=="ok"){
            model.addAttribute("result","ok");
        }
        model.addAttribute("skillsInformation", user);
        return "resume/skillsInfor";
        //return "success";
    }

    //修改指定id的技能信息
    @RequestMapping("/setSkills.action")
    public String setSkills(User user, HttpServletRequest request) throws Exception {
        User per = (User) request.getSession().getAttribute("user");
        int id = per.getPkUserId();
        user.setPkUserId(id);
        resumeService.setSkillsInformation(user);

        request.setAttribute("result","ok");
        return "forward:/resume/getSkills.action?id=" + user.getPkUserId();

    }

    //获取指定id的教育和工作经历
    @RequestMapping("/getExperience.action")
    public String getExperience(Model model, HttpServletRequest request) throws Exception {
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer userId = loginUser.getPkUserId();
        User user = resumeService.getCareerAndEducationExp(userId);
        String result = request.getParameter("result");
        if(result!=null){
            model.addAttribute("result","ok");
        }
        model.addAttribute("careerAndEducationExp", user);
        return "resume/experienceInfor";
    }

    //修改指定id的教育和工作经历
    @RequestMapping(value="/setExperience.action",produces="application/json;charset=UTF-8")
    @ResponseBody
    public Object setExperience(HttpServletRequest request,String work,String study,String education) throws Exception {
        Map<String,String> map = new HashMap<String,String>();
        User loginUser = (User) request.getSession().getAttribute("user");
        loginUser.setUserWorkExperience(work);
        loginUser.setUserEduExperience(study);
        loginUser.setUserEducation(education);

        resumeService.setCareerAndEducationExp(loginUser);
        map.put("result","changepass");
        return map;
    }

    //获取指定id的个人描述
    @RequestMapping("/getDescription.action")
    public String getDescription(Model model, HttpServletRequest request) throws Exception {
        User loginUser = (User)request.getSession().getAttribute("user");
        String result = request.getParameter("result");
        if(result!=null){
            model.addAttribute("result","ok");
        }
        model.addAttribute("personalDescription", loginUser.getUserIntroduction());
        return "resume/descriptionInfor";
    }

    //修改指定id的个人描述
    @RequestMapping(value="/setDescription.action",produces="application/json;charset=UTF-8")
    @ResponseBody
    public Object setDescription(HttpServletRequest request,String resume) throws Exception {
        Map<String,String> map = new HashMap<String,String>();
        User per = (User) request.getSession().getAttribute("user");
        int id = per.getPkUserId();
        User user = new User();
        user.setPkUserId(id);
        user.setUserIntroduction(resume);

        resumeService.setPersonalDescription(user);
        ((User) request.getSession().getAttribute("user")).setUserIntroduction(resume);
        map.put("result","changepass");
        return map;

    }


}
