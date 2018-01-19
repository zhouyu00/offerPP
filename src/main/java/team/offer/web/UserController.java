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
public class UserController {

    @Resource
    private UserService userService;

    @RequestMapping("/detail.action")
    public String login(Model model, HttpServletRequest request) throws Exception {
        String id = request.getParameter("id");
        Integer userId = Integer.parseInt(id);
        User user = userService.findUserById(userId);
        model.addAttribute("user",user);
        return "userdetail";

    }
}
