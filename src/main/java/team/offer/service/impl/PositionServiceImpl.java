package team.offer.service.impl;

import org.springframework.stereotype.Service;
import team.offer.dao.PositionDao;
import team.offer.entity.Position;
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

    public Position detailOfPosition(Integer id) throws Exception {
        return null;
    }

    public List<Position> queryPosition(String name, Map<String, List<String>> keyWords) throws Exception {
        return null;
    }
}
