package com.Dao.Impl;

import java.math.BigInteger;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.FaultsDao;
import com.Model.Faults;


@EnableTransactionManagement
@Transactional
@Repository
@SuppressWarnings("rawtypes")
public class FaultsDaoImpl extends BaseDaoImpl<Faults, BigInteger> implements FaultsDao{
	public FaultsDaoImpl() {
		super(Faults.class);
	}

	
	@Override
	public int changeFaultSeenStatus(BigInteger faultId, boolean status) {
		Query q = getSession().createSQLQuery("update faults set isnew = :status where id = :faultId");
		q.setParameter("status", status);
		q.setParameter("faultId", faultId);
		return q.executeUpdate();
	}
}
