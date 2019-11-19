package com.Dao.Impl;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.FaultResultDao;
import com.Model.FaultResult;

@EnableTransactionManagement
@Transactional
@Repository
//@SuppressWarnings({ "rawtypes", "unchecked" })
public class FaultResultDaoImpl extends BaseDaoImpl<FaultResult, Long> implements FaultResultDao{
	
	public FaultResultDaoImpl() {
		super(FaultResult.class);
	}

}
