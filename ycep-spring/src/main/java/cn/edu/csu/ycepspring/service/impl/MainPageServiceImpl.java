package cn.edu.csu.ycepspring.service.impl;

import cn.edu.csu.ycepspring.entity.Game;
import cn.edu.csu.ycepspring.entity.Kind;
import cn.edu.csu.ycepspring.entity.dto.GameVO;
import cn.edu.csu.ycepspring.entity.dto.KnowledgeAndGame;
import cn.edu.csu.ycepspring.mapper.MainPageMapper;
import cn.edu.csu.ycepspring.service.MainPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainPageServiceImpl implements MainPageService {
    @Autowired
    private MainPageMapper mainPageMapper;

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
}
