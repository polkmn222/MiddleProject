package com.tjoeun.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tjoeun.vo.User;

@Mapper
public interface UserMapper {
	
	String login(User user);
	
	int insertUser(User user);
    int addAndGetKey(User user);
    
    User getUserById(String uid);
    List<User> getUserList();
    List<Map<String,String>> getUserMap();
   
    int updateUser(User u);
    int updateByMap(Map<String,String> map);
   
    int deleteUser(User user);
    

	
/* 위에 선언된 Dynamic SQL을 사용하는 메소드  선언 */
    User findWithoutId(User user);

}
