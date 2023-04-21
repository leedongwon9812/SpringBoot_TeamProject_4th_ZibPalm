package tnsubsidiary.zibpalm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tnsubsidiary.zibpalm.domain.Info;
import tnsubsidiary.zibpalm.domain.Paginator;
import tnsubsidiary.zibpalm.domain.Post;
import tnsubsidiary.zibpalm.mapper.PostMapper;

import java.util.List;

@Service
public class PostServiceImpl implements PostService{

    @Autowired
    PostMapper postMapper;

    @Override
    public List<Post> postGetList(Paginator paginator) {
        return postMapper.postGetList(paginator);
    }

    @Override
    public List<Post> postGetMyList(Paginator paginator){
        return postMapper.postGetMyList(paginator);
    }

    @Override
    public String checkIsAdmin(String email){
        return postMapper.checkIsAdmin(email);
    }

    @Override
    public Post selectBySeq(long postId) {
        return postMapper.selectBySeq(postId);
    }

    @Override
    public void selectHitsUpdatePost(long postId){
        postMapper.selectHitsUpdatePost(postId);
    }

    @Override
    public List<Info>  getSelectInfo(){
        return postMapper.getSelectInfo();
    }

    @Override
    public Info getInfoBySeq(long pinfoId){
        return postMapper.getInfoBySeq(pinfoId);
    }

    @Override
    public List<Post> searchGetList(Paginator paginator) {
        return postMapper.searchGetList(paginator);
    }

    @Override
    public long getTotalCount() {
        return postMapper.getTotalCount();
    }

    @Override
    public long getTotalAPTCount(){
        return postMapper.getTotalAPTCount();
    }

    @Override
    public long getTotalMyCount(String email){
        return postMapper.getTotalMyCount(email);
    }

    @Override
    public long getModifiedTotalCount(Paginator paginator) {
        return postMapper.getModifiedTotalCount(paginator);
    }

    @Override
    public List<Info>  getSearchInfo(String text){
        return postMapper.getSearchInfo(text);
    }

    @Override
    public List<Info> getSearchInfoAuto(String text){
        return postMapper.getSearchInfoAuto(text);
    }

    @Override
    public void insertPost(Post post){
        postMapper.insertPost(post);
    }

    @Override
    public void deletePost(long postId){
        postMapper.deletePost(postId);
    }

    @Override
    public void updatePost(Post post){
        postMapper.updatePost(post);
    }
}
