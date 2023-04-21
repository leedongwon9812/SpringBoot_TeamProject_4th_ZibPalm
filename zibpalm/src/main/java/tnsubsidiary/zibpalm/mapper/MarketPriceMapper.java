package tnsubsidiary.zibpalm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import tnsubsidiary.zibpalm.domain.Gu;
import tnsubsidiary.zibpalm.domain.Info;

import java.util.HashMap;
import java.util.List;

@Mapper
@Repository
public interface MarketPriceMapper {
    List<Gu> getGuname();
    long getGuId(String guname);
    List<Info> getInfoList(String guid);
    List<Info> guidSelectList(HashMap<String, Object> input);
    List<Info> getAptList(HashMap<String, Object> input);
    List<Info> dongSelectList(HashMap<String, Object> input);
    List<Info> getEareaList(HashMap<String, Object> input);
    List<Info> aptSelectList(HashMap<String, Object> input);
    List<Info> getPriceList(HashMap<String, Object> input);
    List<Info> searchList(HashMap<String, Object> search);
    long getTotalCount(String guid);
    long getTotalCountDong(HashMap<String, String> guidDong);
    long getTotalCountApt(HashMap<String, Object> input);
    long getTotalCountEarea(HashMap<String, Object> input);
    long getTotalCountSearch(HashMap<String, Object> search);
    List<String> getListByKeyword(String keyword);
    List<String> getDongListByKeyword(String keyword);
    List<String> getGunameListByKeyword(String keyword);
}
