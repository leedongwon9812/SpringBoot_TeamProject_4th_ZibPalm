package tnsubsidiary.zibpalm.service;

import tnsubsidiary.zibpalm.domain.Fcomment;
import tnsubsidiary.zibpalm.domain.Paginator;
import tnsubsidiary.zibpalm.domain.Scomment;

import java.util.HashMap;
import java.util.List;

public interface CommentService {
    long getTotalCountFC(Long postId);

    HashMap<String, Object> forFcommentList(Paginator paginator, Long postId);

    List<Fcomment> fcommentGetList(HashMap<String, Object> hashMap);

    List<Scomment> scommentGetList(long fcId);

    void insertFcomment(Fcomment fcomment);

    void deleteFcomment(long fcId);

    void insertScomment(Scomment scomment);

    void deleteScomment(long scId);
}
