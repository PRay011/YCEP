package cn.edu.csu.ycepspring.service;

import cn.edu.csu.ycepspring.entity.po.mongo.PaperDocument;

import java.util.List;

public interface PaperService {
    void savePaper(PaperDocument paperDocument);

    List<PaperDocument> getPapers(int account);
}
