package cn.edu.csu.ycepspring.mapper;

import cn.edu.csu.ycepspring.entity.Game;
import cn.edu.csu.ycepspring.entity.Item;
import cn.edu.csu.ycepspring.entity.Knowledge;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InterestMapper {

    void deleteOldInterest(@Param("account") int account);

    void insertInterest(@Param("account") int account, @Param("itemId") int itemId);

    List<Item> selectMyInterest(@Param("account") int account);

    List<Knowledge> selectKnowledgeByInterest(@Param("account") int account);

    List<Game> selectGameByInterest(@Param("account") int account);
}
