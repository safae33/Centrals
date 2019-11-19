package com.Dao;

import java.math.BigInteger;
import java.util.List;

import com.Model.DetachedFaults;
@SuppressWarnings("rawtypes")
public interface DetachedFaultsDao extends BaseDao<DetachedFaults, BigInteger> {

	List getFromAdminByToAdmin(BigInteger toAdmin);
	List getToAdminByFromAdmin(BigInteger toAdmin);
	int delByToAdminId(BigInteger toAdmin);
	int delByFromAdminId(BigInteger fromAdmin);

}
