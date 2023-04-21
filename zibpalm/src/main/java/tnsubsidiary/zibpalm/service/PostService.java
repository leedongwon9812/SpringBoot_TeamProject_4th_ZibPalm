package tnsubsidiary.zibpalm.service;

import tnsubsidiary.zibpalm.domain.Info;
import tnsubsidiary.zibpalm.domain.Paginator;
import tnsubsidiary.zibpalm.domain.Post;

import java.util.List;

public interface PostService {
    List<Post> searchGetList(Paginator paginator);

    List<Post> postGetList(Paginator paginator);

    List<Post> postGetMyList(Paginator paginator);

    String checkIsAdmin(String email);

    Post selectBySeq(long postId);

    void selectHitsUpdatePost(long postId);

    List<Info>  getSelectInfo();

    Info getInfoBySeq(long pinfoId);

    long getTotalCount();

    long getTotalAPTCount();

    long getTotalMyCount(String email);

    long getModifiedTotalCount(Paginator paginator);

    List<Info>  getSearchInfo(String text);

    List<Info> getSearchInfoAuto(String text);

    void insertPost(Post post);

    void deletePost(long postId);

    void updatePost(Post post);
}
