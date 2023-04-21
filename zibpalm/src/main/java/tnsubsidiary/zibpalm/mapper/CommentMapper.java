package tnsubsidiary.zibpalm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import tnsubsidiary.zibpalm.domain.Fcomment;
import tnsubsidiary.zibpalm.domain.Scomment;

import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
public interface CommentMapper {
    long getTotalCountFC(Long postId);

    List<Fcomment> fcommentGetList(HashMap<String, Object> hashMap);

    List<Scomment> scommentGetList(long fcId);

    void insertFcomment(Fcomment fcomment);

    void deleteFcomment(long fcId);

    void insertScomment(Scomment scomment);

    void deleteScomment(long scId);
}
