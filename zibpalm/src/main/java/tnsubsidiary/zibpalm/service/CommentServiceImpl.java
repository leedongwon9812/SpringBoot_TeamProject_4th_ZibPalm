package tnsubsidiary.zibpalm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tnsubsidiary.zibpalm.domain.Fcomment;
import tnsubsidiary.zibpalm.domain.Paginator;
import tnsubsidiary.zibpalm.domain.Scomment;
import tnsubsidiary.zibpalm.mapper.CommentMapper;

import java.util.HashMap;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    CommentMapper commentMapper;
    @Override
    public long getTotalCountFC(Long postId) {
        return commentMapper.getTotalCountFC(postId);
    }

    @Override
    public HashMap<String, Object> forFcommentList(Paginator paginator, Long postId) {
        HashMap<String, Object> searchMap = new HashMap<>();
        searchMap.put("postId", postId);
        searchMap.put("paginator", paginator);
        return searchMap;
    }

    @Override
    public List<Fcomment> fcommentGetList(HashMap<String, Object> hashMap){
        return commentMapper.fcommentGetList(hashMap);
    }

    @Override
    public List<Scomment> scommentGetList(long fcId){
        return commentMapper.scommentGetList(fcId);
    }

    @Override
    public void insertFcomment(Fcomment fcomment){
        commentMapper.insertFcomment(fcomment);
    }

    @Override
    public void deleteFcomment(long fcId){
        commentMapper.deleteFcomment(fcId);
    }

    @Override
    public void insertScomment(Scomment scomment){
        commentMapper.insertScomment(scomment);
    }

    @Override
    public void deleteScomment(long scId){
        commentMapper.deleteScomment(scId);
    }
}
