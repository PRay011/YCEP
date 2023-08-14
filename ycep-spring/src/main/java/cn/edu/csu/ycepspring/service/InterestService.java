package cn.edu.csu.ycepspring.service;

import cn.edu.csu.ycepspring.entity.po.mysql.Game;
import cn.edu.csu.ycepspring.entity.po.mysql.Item;
import cn.edu.csu.ycepspring.entity.po.mysql.Knowledge;

import java.util.List;

public interface InterestService {

    void insertInterest(int account, int[] itemIds);

    List<Item> getMyInterest(int account);

    List<Knowledge> recommendKnowledge(int account);

    List<Game> recommendGame(int account);
}
