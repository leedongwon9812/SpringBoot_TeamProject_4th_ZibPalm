package tnsubsidiary.zibpalm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tnsubsidiary.zibpalm.domain.MainPost;
import tnsubsidiary.zibpalm.mapper.MainPostMapper;

import java.util.List;

@Service
public class MainPostImpl implements MainPostService{

    @Autowired
    MainPostMapper mainPostMapper;

    @Override
    public List<MainPost> mainPostGetList(){
        return mainPostMapper.mainPostGetList();
    };

    @Override
    public MainPost selectBySeqM(long mpId) {
        MainPost mainPost = mainPostMapper.selectBySeqM(mpId);
        return mainPost;
    }

    @Override
    public void insertMainPost(MainPost mainPost){
        mainPostMapper.insertMainPost(mainPost);
    }

    @Override
    public void deleteMainpost(long mpId){
        mainPostMapper.deleteMainpost(mpId);
    }

    @Override
    public void updateMainPost(MainPost mainPost){
        mainPostMapper.updateMainPost(mainPost);
    }

    @Override
    public void selectHitsUpMainPost(long mpId){
        mainPostMapper.selectHitsUpMainPost(mpId);
    }
}
