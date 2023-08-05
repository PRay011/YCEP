package cn.edu.csu.ycepspring.service;

import cn.edu.csu.ycepspring.entity.Game;
import cn.edu.csu.ycepspring.entity.Kind;
import cn.edu.csu.ycepspring.entity.dto.KnowledgeAndGame;

import java.util.List;

public interface MainPageService {
    List<Kind> getKindAndItem();

    List<KnowledgeAndGame> getKnowledgeAndGame(int itemId);

    List<Game> getGameList(int knowledgeId);
}
