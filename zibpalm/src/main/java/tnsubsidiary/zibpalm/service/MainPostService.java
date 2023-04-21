package tnsubsidiary.zibpalm.service;

import tnsubsidiary.zibpalm.domain.MainPost;

import java.util.List;

public interface MainPostService {
    List<MainPost> mainPostGetList();

    MainPost selectBySeqM(long mpId);

    void insertMainPost(MainPost mainPost);

    void deleteMainpost(long mpId);

    void selectHitsUpMainPost(long mpId);

    void updateMainPost(MainPost mainPost);
}
