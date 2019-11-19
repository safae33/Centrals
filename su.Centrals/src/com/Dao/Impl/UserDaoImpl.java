package com.Dao.Impl;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.UserDao;
import com.Model.User;
import com.Model.TypeAndPw;

@EnableTransactionManagement
@Transactional
@Repository
@SuppressWarnings({ "rawtypes", "unchecked" })
public class UserDaoImpl extends BaseDaoImpl<User, Integer> implements UserDao{

	public UserDaoImpl() {
		super(User.class);
	}
	
	@Override
	public TypeAndPw GetUserByUserName(String username) {
		Query q;
		q = getSession().createSQLQuery("SELECT userType FROM Users WHERE uName = :username and isactive");
		q.setParameter("username", username);
		List<Integer> type = q.getResultList();
		q = getSession().createSQLQuery("SELECT password_ FROM Users WHERE uName = :username and isactive");
		q.setParameter("username", username);
		List<String> pw = q.getResultList();
		return new TypeAndPw(type.get(0), pw.get(0));
	}

	@Override
	public String GetCentralByUserName(String username) {
		Query q = getSession().createSQLQuery("SELECT central FROM Users WHERE uName = :username");
		q.setParameter("username", username);
		return q.getResultList().get(0).toString();
	}

	@Override
	public int GetIdByUserName(String username) {
		Query q = getSession().createSQLQuery("SELECT id FROM Users WHERE uName = :username");
		q.setParameter("username", username);
		return (int) q.getResultList().get(0);
	}

	@Override
	public int updateUserPassword(String username, String password, String oldPw) {
		Query q = getSession().createSQLQuery("update users set password_ = :password where uName = :username and password_ = :oldPw");
		q.setParameter("username", username);
		q.setParameter("password", password);
		q.setParameter("oldPw", oldPw);
		return q.executeUpdate();
	}

	@Override
	public boolean checkIfUserAdmin(int id) {
		Query q = getSession().createSQLQuery("select case when count(*) = 0 then false else true end from users where id = :id and userType=3");
		q.setParameter("id", id);
		return (boolean) q.getResultList().get(0);
	}

	@Override
	public boolean checkUserNameExistence(String username) {
		Query q = getSession().createSQLQuery("select case when count(*) = 0 then false else true end from users where lower(uName) = :username");
		q.setParameter("username", username);
		return (boolean) q.getResultList().get(0);
	}
	
	@Override
	public int getCentralIdByUserName(String userName) {
		Query q = getSession().createSQLQuery("select central from users where uName = :userName");
		q.setParameter("userName", userName);
		return (int) q.getResultList().get(0);
	}

}
