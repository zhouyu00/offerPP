package team.offer.service;

import com.github.pagehelper.PageInfo;
import team.offer.entity.Position;
import team.offer.entity.PositionQuery;
import team.offer.entity.PositionVo;

import java.util.List;
import java.util.Map;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 16:03 2018/1/19
 * @Modified By:
 */
public interface PositionService {
    //职位详情
    PositionQuery detailOfPosition(Integer id,Integer uid) throws Exception;

    //职位搜索
    List<PositionQuery> queryPosition(Integer uid) throws Exception;


    //分页搜索
    PageInfo<PositionQuery> queryByPage(Integer uid,String name, List<String> places, List<String> sizes, List<String> educations, List<String> industries, List<String> properties,List<String> times, Integer pageNo, Integer pageSize) throws Exception;
}
