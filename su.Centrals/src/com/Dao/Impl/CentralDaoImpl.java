package com.Dao.Impl;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.CentralDao;
import com.Model.Central;

@EnableTransactionManagement
@Transactional
@Repository
@SuppressWarnings("rawtypes")
public class CentralDaoImpl extends BaseDaoImpl<Central, Integer> implements CentralDao{
	
	public CentralDaoImpl(){
		super(Central.class);
	}
	
	@Override
	public String GetCentraNamelById(int id) {
		Query q = getSession().createSQLQuery("SELECT name_ FROM Centrals WHERE id = :id");
		q.setParameter("id", id);
		return (String) q.getResultList().get(0);
	}

	@Override
	public boolean checkCentralNameExistence(String centralName) {
		Query q = getSession().createSQLQuery("select case when count(*) = 0 then false else true end from centrals where lower(name_) = :centralName");
		q.setParameter("centralName", centralName);
		return (boolean) q.getResultList().get(0);
	}
	
	@Override
	public List getAllCentralIdsAndNames() {
		Query q = getSession().createSQLQuery("select id, name_ from centrals where id != 0");
		return q.getResultList();
	}

	@Override
	public int GetCentralIdByName(String centralName) {
		Query q = getSession().createSQLQuery("SELECT id FROM Centrals WHERE name_ = :centralName");
		q.setParameter("centralName", centralName);
		return (int) q.getResultList().get(0);
	}
}
