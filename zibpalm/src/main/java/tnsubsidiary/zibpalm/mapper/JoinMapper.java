package tnsubsidiary.zibpalm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import tnsubsidiary.zibpalm.domain.Login;

@Repository
@Mapper
public interface JoinMapper {

   void insertKey(Login login);

   int checkEmail(String email);

   int checkNick(String nickname);

   int checkPhone(String phone);

   void insertAdmin(Login login);

   void deleteUser(String email);

   void updateUser(Login login);
}
