package cn.edu.csu.ycepspring.service;

import cn.edu.csu.ycepspring.entity.dto.PaperBrief;
import cn.edu.csu.ycepspring.entity.po.mongo.PaperDocument;
import org.springframework.data.domain.Page;

public interface PaperService {
    void savePaper(PaperDocument paperDocument);

    Page<PaperBrief> getPaperList(int account, int pageNum, int pageSize);

    PaperDocument getPaper(String id);
}
