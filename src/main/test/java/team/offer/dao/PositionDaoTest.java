package team.offer.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import team.offer.entity.PositionQuery;

import javax.annotation.Resource;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 18:16 2018/3/3
 * @Modified By:
 */
//配置spring和junit整合，这样junit在启动时就会加载spring容器
@RunWith(SpringJUnit4ClassRunner.class)
//告诉junit spring的配置文件
@ContextConfiguration(locations = {"classpath*:spring/spring-dao.xml"})
public class PositionDaoTest {
    //注入Dao实现类依赖
    @Resource
    private PositionDao positionDao;

    @Resource
    private UserDao userDao;



    @Test
    public void query() throws Exception{
//        String name ="Java";
        List<String> places = new ArrayList<String>();
        places.add("杭州");
        places.add("上海");
        places.add("北京");
        places.add("深圳");
        places.add("广州");
        places.add("武汉");
        List<String> sizes = new ArrayList<String>();
        sizes.add("20人以下");
        sizes.add("20-50人");
        sizes.add("50-100人");
        sizes.add("100-500人");
        sizes.add("500-1000人");
        sizes.add("1000人以上");
        List<String> educations = new ArrayList<String>();
        educations.add("本科");
        educations.add("硕士");
        educations.add("博士");
        List<String> industries = new ArrayList<String>();
        industries.add("移动互联网");
        industries.add("游戏");
        List<String> properties = new ArrayList<String>();
        properties.add("实习");
        properties.add("全职");
        properties.add("兼职");
        List<String> times = new ArrayList<String>();
        times.add("一年及以上");
        times.add("两年及以上");
        times.add("三年及以上");
        times.add("五年及以上");
        times.add("十年及以上");
        List<PositionQuery> positionQueries = positionDao.queryPositionByConditions(null,places,sizes,educations,industries,properties,times);
//        for(PositionQuery positionQuery:positionQueries){
//            if(userDao.queryCollectionIdByUidAndPid(7,positionQuery.getPkPositionId())!=null){
//                positionQuery.setCollectionFlag(1);
//            }
//        }
        System.out.println(positionQueries.size());
        System.out.println(positionDao.queryPositionByConditions(null,null,null,null,null,null,null));
    }
}