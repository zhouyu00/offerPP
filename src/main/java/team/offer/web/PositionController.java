package team.offer.web;

import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import team.offer.entity.Position;
import team.offer.entity.PositionQuery;
import team.offer.entity.User;
import team.offer.service.PositionService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 16:19 2018/1/19
 * @Modified By:
 */
@Controller
@RequestMapping("/position")
public class PositionController {
    @Resource
    private PositionService positionService;

    //职位详情
    @RequestMapping("/detail.action")
    public String detail(Model model, HttpServletRequest request,Integer id) throws Exception{
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        PositionQuery positionQuery = positionService.detailOfPosition(id,uid);
        String skill = positionQuery.getPositionSkill();
        String[] skills = skill.split(";");
        model.addAttribute("positionQuery",positionQuery);
        model.addAttribute("user",loginUser);
        model.addAttribute("skills",skills);
        return "user/position_info";
    }

    //职位搜索
    @RequestMapping(value="/query.action")
    public String query(Model model,HttpServletRequest request,String name,String[] places,String[] sizes,String[] educations,String[] industries,String[] experiments,String[] properties,Integer page) throws Exception{
        List<String> place = PositionController.arrayToList(places);
        List<String> size = PositionController.arrayToList(sizes);
        List<String> education = PositionController.arrayToList(educations);
        List<String> industry = PositionController.arrayToList(industries);
        List<String> experiment = PositionController.arrayToList(experiments);
        List<String> property = PositionController.arrayToList(properties);
        User loginUser = (User)request.getSession().getAttribute("user");
        Integer uid = loginUser.getPkUserId();
        PageInfo<PositionQuery> positionQuery = positionService.queryByPage(uid,name,place,size,education,industry,property,experiment,page,5);

        model.addAttribute("positionQuery",positionQuery);
        model.addAttribute("places",place);
        model.addAttribute("sizes",size);
        model.addAttribute("educations",education);
        model.addAttribute("industries",industry);
        model.addAttribute("experiments",experiment);
        model.addAttribute("properties",property);
        model.addAttribute("name",name);
        model.addAttribute("user",loginUser);
        return "user/search";
    }

    //对职位搜索接收的数组进行处理，转换成集合
    public static List<String> arrayToList(String[] arrays){
        if(arrays==null){
            return null;
        }
        List<String> arrayList = new ArrayList<String>();
        for(String arr:arrays){
            arr=arr.trim();
            if(arr!=null && arr !="" && !arr.equals("")){
                arrayList.add(arr);
            }
        }
        return arrayList;
    }
}
