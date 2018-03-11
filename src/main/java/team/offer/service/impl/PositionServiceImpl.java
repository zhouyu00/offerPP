package team.offer.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;
import team.offer.dao.PositionDao;
import team.offer.dao.UserDao;
import team.offer.entity.Position;
import team.offer.entity.PositionQuery;
import team.offer.entity.PositionVo;
import team.offer.entity.User;
import team.offer.service.PositionService;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 16:06 2018/1/19
 * @Modified By:
 */
@Service
public class PositionServiceImpl implements PositionService {
    @Resource
    private PositionDao positionDao;

    @Resource
    private UserDao userDao;

    public PositionQuery detailOfPosition(Integer id,Integer uid) throws Exception {
        //获取职位详情
        PositionQuery positionQuery = positionDao.queryPositionById(id);
        if(userDao.queryCollectionIdByUidAndPid(uid,positionQuery.getPkPositionId())!=null){
            positionQuery.setCollectionFlag(1);
        }
        if(userDao.queryApplicationIdByUidAndPid(uid,positionQuery.getPkPositionId())!=null){
            positionQuery.setDeliverFlag(1);
        }
        return positionQuery;
    }

    public List<PositionQuery> queryPosition(Integer uid) throws Exception {
        //获取职位表前5个职位
        List<PositionQuery> positionQueries = positionDao.queryPosition();
        for(PositionQuery positionQuery:positionQueries){
            if(userDao.queryCollectionIdByUidAndPid(uid,positionQuery.getPkPositionId())!=null){
                positionQuery.setCollectionFlag(1);
            }
        }
        return positionQueries;
    }

    public PageInfo<PositionQuery> queryByPage(Integer uid,String name, List<String> places,List<String> sizes,List<String> educations,List<String> industries,List<String> properties,List<String> times,Integer pageNo, Integer pageSize) throws Exception{
        //对页数和每页显示的数据数进行处理
        pageNo = pageNo == null?1:pageNo;
        pageSize = pageSize == null ?5:pageSize;
        //设置PageHelper
        PageHelper.startPage(pageNo,pageSize);
        //进行查询，同时根据查询结果对用户是否收藏该职位进行设置
        List<PositionQuery> positionQueries = positionDao.queryPositionByConditions(name,places,sizes,educations,industries,properties,times);

        for(PositionQuery positionQuery:positionQueries){
            if(userDao.queryCollectionIdByUidAndPid(uid,positionQuery.getPkPositionId())!=null){
                positionQuery.setCollectionFlag(1);
            }
        }

        for(PositionQuery positionQuery:positionQueries){
            String[] skills = positionQuery.getPositionSkill().split(";");
            positionQuery.setSkills(skills);
        }
        //用PageInfo对结果进行包装
        PageInfo<PositionQuery> positions = new PageInfo<PositionQuery>(positionQueries);
        //返回
        return positions;
    }
}
