package com.Dao.Impl;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.DetachedFaultsDao;
import com.Model.DetachedFaults;

@EnableTransactionManagement
@Transactional
@Repository
@SuppressWarnings("rawtypes")
public class DetachedFaultsDaoImpl extends BaseDaoImpl<DetachedFaults, BigInteger> implements DetachedFaultsDao{

	public DetachedFaultsDaoImpl(){
		super(DetachedFaults.class);
	}

	
	@Override
	public List getFromAdminByToAdmin(BigInteger toAdmin) {
		Query q = getSession().createSQLQuery("select fromAdmin from DetachedFaults where toAdmin = :toAdmin");
		q.setParameter("toAdmin", toAdmin);
		return q.getResultList();
	}


	@Override
	public List getToAdminByFromAdmin(BigInteger fromAdmin) {
		Query q = getSession().createSQLQuery("select toAdmin from DetachedFaults where fromAdmin = :fromAdmin");
		q.setParameter("fromAdmin", fromAdmin);
		return q.getResultList();
	}
	
	@Override
	public int delByToAdminId(BigInteger toAdmin) {
		Query q = getSession().createSQLQuery("delete from DetachedFaults where toAdmin = :toAdmin");
		q.setParameter("toAdmin", toAdmin);
		return q.executeUpdate();
	}
	
	@Override
	public int delByFromAdminId(BigInteger fromAdmin) {
		Query q = getSession().createSQLQuery("delete from DetachedFaults where fromAdmin = :fromAdmin");
		q.setParameter("fromAdmin", fromAdmin);
		return q.executeUpdate();
	}
}
