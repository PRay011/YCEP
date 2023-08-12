package cn.edu.csu.ycepspring.service.impl;

import cn.edu.csu.ycepspring.entity.dto.GameVO;
import cn.edu.csu.ycepspring.entity.dto.KnowledgeAndGame;
import cn.edu.csu.ycepspring.entity.po.mongo.KnowledgeDocument;
import cn.edu.csu.ycepspring.entity.po.mysql.Game;
import cn.edu.csu.ycepspring.entity.po.mysql.Kind;
import cn.edu.csu.ycepspring.mapper.MainPageMapper;
import cn.edu.csu.ycepspring.service.MainPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MainPageServiceImpl implements MainPageService {
    @Autowired
    private MainPageMapper mainPageMapper;

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public List<Kind> getKindAndItem() {
        return mainPageMapper.selectKindAndItem();
    }

    @Override
    public List<Game> getGameList(int knowledgeId) {
        return mainPageMapper.selectGameByKnowledgeId(knowledgeId);
    }

    @Override
    public List<KnowledgeAndGame> getKnowledgeAndGame(int itemId) {
        List<KnowledgeAndGame> knowledgeAndGameList = mainPageMapper.selectKnowledgeAndGame(itemId);
        String kindName = mainPageMapper.selectKindNameByItemId(itemId);
        for (KnowledgeAndGame k : knowledgeAndGameList) {
            k.setKindName(kindName);
            GameVO game = k.getGame();
            if (game != null) {
                game.setKindName(kindName);
            }
        }
        return knowledgeAndGameList;
    }

    @Override
    public Map<String, Object> getKnowledgeAndGameByKind(int kindId, int pageNum, int pageSize) {
        int total = mainPageMapper.selectKnowledgeAndGameByKindCount(kindId);
        List<KnowledgeAndGame> list = mainPageMapper.selectKnowledgeAndGameByKind(kindId, pageSize, (pageNum - 1) * pageSize);
        Map<String, Object> data = new HashMap<>();
        data.put("total", total);
        data.put("list", list);
        return data;
    }

    @Override
    public KnowledgeDocument getKnowledgeInfo(int id) {
        return mongoTemplate.findById(id, KnowledgeDocument.class, "knowledge");
    }
}
