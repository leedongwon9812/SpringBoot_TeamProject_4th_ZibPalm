package tnsubsidiary.zibpalm.service;

import tnsubsidiary.zibpalm.domain.Gu;
import tnsubsidiary.zibpalm.domain.Info;

import java.util.HashMap;
import java.util.List;

public interface MarketPriceService {
    List<Gu> getGunameS();

    long getGuId(String guname);
    List<Info> getInfoListS(String guid);
    List<Info> guidSelectListS(HashMap<String, Object> input);
    List<Info> getAptListS(HashMap<String, Object> input);
    List<Info> dongSelectListS(HashMap<String, Object> input);
    List<Info> getEareaListS(HashMap<String, Object> input);
    List<Info> aptSelectListS(HashMap<String, Object> input);
    List<Info> getPriceListS(HashMap<String, Object> input);
    List<Info> searchListS(HashMap<String, Object> search);
    long getTotalCountS(String guid);
    long getTotalCountDongS(HashMap<String, String> guidDong);
    long getTotalCountAptS(HashMap<String, Object> input);
    long getTotalCountEareaS(HashMap<String, Object> input);
    long getTotalCountSearchS(HashMap<String, Object> search);
    List<String> getListByKeywordS(String keyword);
    List<String> getDongListByKeywordS(String keyword);
    List<String> getGunameListByKeywordS(String keyword);
}
