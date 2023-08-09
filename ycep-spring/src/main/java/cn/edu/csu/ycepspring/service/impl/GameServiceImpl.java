package cn.edu.csu.ycepspring.service.impl;

import cn.edu.csu.ycepspring.entity.po.mongo.game.Choice;
import cn.edu.csu.ycepspring.entity.po.mongo.game.GameDocument;
import cn.edu.csu.ycepspring.entity.po.mongo.game.GameRole;
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
    public List<Choice> getInteraction(int gameId, int characterId, int interactionNumber) {
        Query query = new Query(Criteria.where("_id").is(gameId));
        query.fields().include("choices");
        GameDocument result = mongoTemplate.findOne(query, GameDocument.class, "game");
        return result.getChoices().get(characterId - 1).get(interactionNumber - 1);
    }

    @Override
    public Map<String, Object> getfinishInteraction(int gameId, int characterId, int interactionNumber, int interactionId) {
        Query query = new Query(Criteria.where("_id").is(gameId));
        query.fields().include("plot");
        GameDocument result = mongoTemplate.findOne(query, GameDocument.class, "game");
        Map<String, Object> resp = new HashMap<>();
        resp.put("isFinished", result.getPlot().get(characterId - 1).size() <= interactionNumber + 1);
        resp.put("plot", result.getPlot().get(characterId - 1).get(interactionNumber));
        return resp;
    }
}
