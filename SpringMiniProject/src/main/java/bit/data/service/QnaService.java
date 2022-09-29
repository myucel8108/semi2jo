package bit.data.service;

import bit.data.dao.QnaDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QnaService implements QnaServiceInter{

    @Autowired
    QnaDaoInter qnaDao;
}
