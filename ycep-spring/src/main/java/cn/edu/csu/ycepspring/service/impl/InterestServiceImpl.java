package cn.edu.csu.ycepspring.service.impl;

import cn.edu.csu.ycepspring.entity.po.mysql.Game;
import cn.edu.csu.ycepspring.entity.po.mysql.Item;
import cn.edu.csu.ycepspring.entity.po.mysql.Knowledge;
import cn.edu.csu.ycepspring.mapper.InterestMapper;
import cn.edu.csu.ycepspring.service.InterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class InterestServiceImpl implements InterestService {
    @Autowired
    private InterestMapper interestMapper;

    @Override
    @Transactional
    public void insertInterest(int account, int[] itemIds) {
        interestMapper.deleteOldInterest(account);
        for (int itemId : itemIds) {
            interestMapper.insertInterest(account, itemId);
        }
    }

    @Override
    public List<Item> getMyInterest(int account) {
        return interestMapper.selectMyInterest(account);
    }

    @Override
    public List<Knowledge> recommendKnowledge(int account) {
        return interestMapper.selectKnowledgeByInterest(account);
    }

    @Override
    public List<Game> recommendGame(int account) {
        return interestMapper.selectGameByInterest(account);
    }
}
