package com.Dao.Impl;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.CentralDao;
import com.Dao.TechnicianNamesDao;
import com.Model.Central;
import com.Model.TechnicianNames;

@EnableTransactionManagement
@Transactional
@Repository
public class TechnicianNamesDaoImpl extends BaseDaoImpl<TechnicianNames, Integer> implements TechnicianNamesDao{

	public TechnicianNamesDaoImpl() {
		super(TechnicianNames.class);
	}

}
