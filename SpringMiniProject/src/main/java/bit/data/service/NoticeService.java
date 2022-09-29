package bit.data.service;

import bit.data.dao.NoticeDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService implements NoticeServiceInter{

    @Autowired
    NoticeDaoInter noticeDao;
}
