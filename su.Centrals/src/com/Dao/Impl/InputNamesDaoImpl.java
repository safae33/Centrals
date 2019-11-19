package com.Dao.Impl;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.InputNamesDao;
import com.Model.InputNames;

@EnableTransactionManagement
@Transactional
@Repository
@SuppressWarnings("rawtypes")
public class InputNamesDaoImpl extends BaseDaoImpl<InputNames, Integer> implements InputNamesDao{
	
	public InputNamesDaoImpl(){
		super(InputNames.class);
	}
	
	
	@Override
	public String GetNameById(int id) {
		Query q = getSession().createSQLQuery("SELECT inputName FROM InputNames WHERE id = :id");
		q.setParameter("id", id);
		return (String) q.getResultList().get(0);
	}

	@Override
	public List GetInputNamesByCentralId(int centralId) {
		Query q = getSession().createSQLQuery("select inputname from inputnames where centralid = :centralId order by id");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}
	
	@Override
	public List GetInputNameIdsByCentralId(int centralId) {
		Query q = getSession().createSQLQuery("select id from inputnames where centralid = :centralId order by id");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}
	
	@Override
	public List getAtGtXwhValuesByInputNameId(int id) {
		Query q = getSession().createSQLQuery("select a_t, g_t, xwh, gkc from inputnames where id = :id");
		q.setParameter("id", id);
		return q.getResultList();
	}
	
	@Override
	public List GetInputNameIdsAndInputNamesByCentralId(int centralId) {
		Query q = getSession().createSQLQuery("select id, inputName from inputnames where centralid = :centralId");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}
	@Override
	public List GetInputNameIdsAndInputNamesByUserName(String userName) {
		Query q = getSession().createSQLQuery("select inpN.id, inpN.inputName from inputnames as inpN inner join Users as us on uName = :userName where inpN.centralId = us.central order by inpN.id");
		q.setParameter("userName", userName);
		return q.getResultList();
	}
}
