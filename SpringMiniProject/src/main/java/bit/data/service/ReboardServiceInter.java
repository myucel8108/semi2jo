package bit.data.service;

import bit.data.dto.ReboardDto;

import java.util.List;

public interface ReboardServiceInter {
    public void insertReboard (ReboardDto dto);
    public List<ReboardDto> getAllReboards(int boardnum);


}
