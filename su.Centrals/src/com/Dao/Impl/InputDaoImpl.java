package com.Dao.Impl;

import java.math.BigInteger;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.InputDao;
import com.Dao.UserDao;
import com.Model.Input;
import com.Model.User;

@EnableTransactionManagement
@Transactional
@Repository
public class InputDaoImpl extends BaseDaoImpl<Input, BigInteger> implements InputDao {
	
	public InputDaoImpl() {
		super(Input.class);
	}
	
}
