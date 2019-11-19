package com.Dao;

import com.Model.TypeAndPw;
import com.Model.User;

public interface UserDao extends BaseDao<User, Integer> {
	
	TypeAndPw GetUserByUserName(String username);
	String GetCentralByUserName(String username);
	int GetIdByUserName(String username);
	int updateUserPassword(String username, String password, String oldPw);
	boolean checkIfUserAdmin(int id);
	boolean checkUserNameExistence(String username);
	int getCentralIdByUserName(String userName);
}
