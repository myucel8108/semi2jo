package bit.data.dao;

import bit.data.dto.BoardDto;
import bit.data.dto.ReboardDto;

import java.util.List;

public interface ReboardDaoInter {
    public void insertReboard (ReboardDto dto);
    public List<ReboardDto> getAllReboards(int boardnum);
    public void deleteByReboardnum (int reboardnum);
//    public ReboardDto selectByNum(int reboardnum);

}
