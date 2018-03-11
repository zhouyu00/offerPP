package team.offer.dao;

import org.apache.ibatis.annotations.Param;
import team.offer.entity.Position;
import team.offer.entity.PositionQuery;
import team.offer.entity.PositionVo;

import java.util.List;
import java.util.Map;

/**
 * @Author:L1ANN
 * @Description:
 * @Date:Created in 15:59 2018/1/19
 * @Modified By:
 */
public interface PositionDao {
    //根据职位id查询职位
    PositionQuery queryPositionById(Integer id) throws Exception;

    //查询职位表前5条数据
    List<PositionQuery> queryPosition() throws Exception;

    //根据名称和查询关键字搜索职位集合
    List<PositionQuery> queryPositionByConditions(@Param("name")String name, @Param("places")List<String> places, @Param("sizes")List<String> sizes, @Param("educations")List<String> educations, @Param("industries")List<String> industries, @Param("properties")List<String> properties, @Param("times")List<String> times) throws Exception;


}
