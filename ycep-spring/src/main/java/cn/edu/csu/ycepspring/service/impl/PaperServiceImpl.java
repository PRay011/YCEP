package cn.edu.csu.ycepspring.service.impl;

import cn.edu.csu.ycepspring.entity.po.mongo.PaperDocument;
import cn.edu.csu.ycepspring.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
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
    public List<PaperDocument> getPapers(int account) {
        Query query = new Query(Criteria.where("account").is(account));
        return mongoTemplate.find(query, PaperDocument.class, "paper");
    }
}
