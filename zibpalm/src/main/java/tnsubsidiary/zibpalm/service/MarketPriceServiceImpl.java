package tnsubsidiary.zibpalm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tnsubsidiary.zibpalm.domain.Gu;
import tnsubsidiary.zibpalm.domain.Info;
import tnsubsidiary.zibpalm.mapper.MarketPriceMapper;

import java.util.HashMap;
import java.util.List;

@Service
public class MarketPriceServiceImpl implements MarketPriceService {
    @Autowired
    MarketPriceMapper mapper;
    @Override
    public List<Gu> getGunameS() {
        return mapper.getGuname();
    }

    @Override
    public long getGuId(String guname){
        return mapper.getGuId(guname);
    }

    @Override
    public List<Info> getInfoListS(String guid) {
        return mapper.getInfoList(guid);
    }

    @Override
    public List<Info> guidSelectListS(HashMap<String, Object> input) {
        return mapper.guidSelectList(input);
    }

    @Override
    public List<Info> getAptListS(HashMap<String, Object> input) {
        return mapper.getAptList(input);
    }

    @Override
    public List<Info> dongSelectListS(HashMap<String, Object> input) {
        return mapper.dongSelectList(input);
    }

    @Override
    public List<Info> getEareaListS(HashMap<String, Object> input) {
        return mapper.getEareaList(input);
    }

    @Override
    public List<Info> aptSelectListS(HashMap<String, Object> input) {
        return mapper.aptSelectList(input);
    }

    @Override
    public List<Info> getPriceListS(HashMap<String, Object> input) {
        return mapper.getPriceList(input);
    }

    @Override
    public List<Info> searchListS(HashMap<String, Object> search) {
        return mapper.searchList(search);
    }

    @Override
    public long getTotalCountS(String guid) {
        return mapper.getTotalCount(guid);
    }

    @Override
    public long getTotalCountDongS(HashMap<String, String> guidDong) {
        return mapper.getTotalCountDong(guidDong);
    }

    @Override
    public long getTotalCountAptS(HashMap<String, Object> input) {
        return mapper.getTotalCountApt(input);
    }

    @Override
    public long getTotalCountEareaS(HashMap<String, Object> input) {
        return mapper.getTotalCountEarea(input);
    }

    @Override
    public long getTotalCountSearchS(HashMap<String, Object> search) {
        return mapper.getTotalCountSearch(search);
    }

    @Override
    public List<String> getListByKeywordS(String keyword) {
        return mapper.getListByKeyword(keyword);
    }

    @Override
    public List<String> getDongListByKeywordS(String keyword) {
        return mapper.getDongListByKeyword(keyword);
    }

    @Override
    public List<String> getGunameListByKeywordS(String keyword) {
        return mapper.getGunameListByKeyword(keyword);
    }
}
