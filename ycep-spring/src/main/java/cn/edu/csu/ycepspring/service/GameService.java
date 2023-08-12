package cn.edu.csu.ycepspring.service;

import cn.edu.csu.ycepspring.entity.po.mongo.game.Choice;
import cn.edu.csu.ycepspring.entity.po.mongo.game.GameRole;
import cn.edu.csu.ycepspring.entity.po.mongo.game.Reinforce;

import java.util.List;
import java.util.Map;

public interface GameService {
    List<GameRole> getCharacter(int gameId);

    Map<String, Object> getStartPlot(int gameId);

    List<Choice> getInteraction(int gameId, int interactionNumber);

    Map<String, Object> getfinishInteraction(int gameId, int characterId, int interactionNumber);

    List<Reinforce> getReinforce(int gameId);
}
