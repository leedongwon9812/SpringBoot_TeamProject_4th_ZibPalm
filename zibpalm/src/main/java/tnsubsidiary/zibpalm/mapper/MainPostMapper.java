package tnsubsidiary.zibpalm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import tnsubsidiary.zibpalm.domain.MainPost;

import java.util.List;

@Mapper
@Repository
public interface MainPostMapper {

    List<MainPost> mainPostGetList();

    MainPost selectBySeqM(long mpId);

    void insertMainPost(MainPost mainPost);

    void deleteMainpost(long mpId);

    void selectHitsUpMainPost(long mpId);

    void updateMainPost(MainPost mainPost);
}
