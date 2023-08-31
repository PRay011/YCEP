package cn.edu.csu.ycepspring.service.impl;

import cn.edu.csu.ycepspring.entity.dto.PaperBrief;
import cn.edu.csu.ycepspring.entity.po.mongo.PaperDocument;
import cn.edu.csu.ycepspring.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.*;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PaperServiceImpl implements PaperService {
    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public void savePaper(PaperDocument paperDocument) {
        mongoTemplate.insert(paperDocument);
    }

    @Override
    public Page<PaperBrief> getPaperList(int account, int pageNum, int pageSize) {
        // 分页
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize, Sort.by(Sort.Order.desc("time")));
        // 选择
        Query query = Query.query(Criteria.where("account").is(account)).with(pageable);
        // 投影
        query.fields().include("_id", "time", "title", "keywords", "brief");

        List<PaperBrief> results = mongoTemplate.find(query, PaperBrief.class, "paper");
        long count = mongoTemplate.count(query, PaperBrief.class, "paper");
        return new PageImpl<>(results, pageable, count);
    }

    @Override
    public PaperDocument getPaper(String id) {
        return mongoTemplate.findById(id, PaperDocument.class, "paper");
    }
}
