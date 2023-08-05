package cn.edu.csu.ycepspring.mapper;

import cn.edu.csu.ycepspring.entity.Game;
import cn.edu.csu.ycepspring.entity.Kind;
import cn.edu.csu.ycepspring.entity.dto.GameVO;
import cn.edu.csu.ycepspring.entity.dto.KnowledgeAndGame;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MainPageMapper {
    List<Kind> selectKindAndItem();

    List<Game> selectGameByKnowledgeId(@Param("knowledgeId") int knowledgeId);

    List<KnowledgeAndGame> selectKnowledgeAndGame(@Param("itemId") int itemId);

    String selectKindNameByItemId(@Param("itemId") int itemId);

    GameVO selectOneGameByKnowledgeId(@Param("knowledgeId") int knowledgeId);
}
