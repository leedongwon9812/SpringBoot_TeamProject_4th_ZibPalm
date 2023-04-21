package tnsubsidiary.zibpalm.mapper;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import tnsubsidiary.zibpalm.domain.Info;
import tnsubsidiary.zibpalm.domain.Paginator;
import tnsubsidiary.zibpalm.domain.Post;

import java.util.List;

@Mapper
@Repository
public interface PostMapper {

    List<Post> searchGetList(Paginator paginator);

    List<Post> postGetList(Paginator paginator);

    List<Post> postGetMyList(Paginator paginator);

    String checkIsAdmin(String email);

    long getTotalCount();

    long getTotalAPTCount();

    long getTotalMyCount(String email);

    long getModifiedTotalCount(Paginator paginator);

    Post selectBySeq(long postId);

    void selectHitsUpdatePost(long postId);

    List<Info> getSelectInfo();

    Info getInfoBySeq(long pinfoId);

    List<Info> getSearchInfo(String text);

    List<Info> getSearchInfoAuto(String text);

    void insertPost(Post post);

    void deletePost(long postId);

    void updatePost(Post post);
}
