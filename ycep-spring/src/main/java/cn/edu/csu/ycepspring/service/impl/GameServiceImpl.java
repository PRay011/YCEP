package cn.edu.csu.ycepspring.service.impl;

import cn.edu.csu.ycepspring.entity.po.mongo.game.*;
import cn.edu.csu.ycepspring.service.GameService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class GameServiceImpl implements GameService {
    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public List<GameRole> getCharacter(int gameId) {
        Query query = new Query(Criteria.where("_id").is(gameId));
        query.fields().include("role");
        GameDocument result = mongoTemplate.findOne(query, GameDocument.class, "game");

        return result.getRole();
    }

    @Override
    public Map<String, Object> getStartPlot(int gameId, int characterId) {
        Query query = new Query(Criteria.where("_id").is(gameId));
        query.fields().include("plot");
        GameDocument result = mongoTemplate.findOne(query, GameDocument.class, "game");

        Map<String, Object> resp = new HashMap<>();
        resp.put("isFinished", false);
        resp.put("plot", result.getPlot().get(characterId - 1).get(0));
        return resp;
    }

    @Override
    public List<Choice> getInteraction(int gameId, int interactionNumber) {
        Query query = new Query(Criteria.where("_id").is(gameId));
        query.fields().include("choices");
        GameDocument result = mongoTemplate.findOne(query, GameDocument.class, "game");

        return result.getChoices().get(interactionNumber - 1);
    }

    @Override
    public Map<String, Object> getfinishInteraction(int gameId, int characterId, int interactionNumber) {
        Query query = new Query(Criteria.where("_id").is(gameId));
        query.fields().include("rolePlotRemoveIndex", "plot");
        GameDocument result = mongoTemplate.findOne(query, GameDocument.class, "game");

        List<Plot> plots = result.getPlot().get(interactionNumber);
        // 移除其他人物的剧情节点,removeIndex必须从小到大排序
        List<Integer> removeIndex = result.getRolePlotRemoveIndex().get(characterId - 1);
        for (int i = 0, length = removeIndex.size(); i < length; i++) {
            plots.remove(removeIndex.get(i) - i);
        }

        Map<String, Object> resp = new HashMap<>();
        resp.put("isFinished", result.getPlot().get(characterId - 1).size() <= interactionNumber + 1);
        resp.put("plot", plots);
        return resp;
    }

    @Override
    public List<Reinforce> getReinforce(int gameId) {
        Query query = new Query(Criteria.where("_id").is(gameId));
        query.fields().include("reinforce");
        GameDocument result = mongoTemplate.findOne(query, GameDocument.class, "game");

        return result.getReinforce();
    }
}
