package tnsubsidiary.zibpalm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import tnsubsidiary.zibpalm.domain.Login;

import java.util.List;

@Repository
@Mapper
public interface LoginMapper {

    Login findByEmail(String email);

    List<Login> findByOthers(String email);
}
