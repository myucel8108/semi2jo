package bit.data.service;

import bit.data.dao.RoomDaoInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService implements RoomServiceInter{

    @Autowired
    RoomDaoInter roomDao;
}
