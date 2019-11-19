package com.Dao.Impl;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.FaultResultMaterialDao;
import com.Model.FaultResultMaterial;

@EnableTransactionManagement
@Transactional
@Repository
@SuppressWarnings("rawtypes")
public class FaultResultMaterialDaoImpl extends BaseDaoImpl<FaultResultMaterial, Long> implements FaultResultMaterialDao{

	public FaultResultMaterialDaoImpl() {
		super(FaultResultMaterial.class);
	}
	

	@Override
	public List getFaultResultMaterialByFaultId(BigInteger faultId) {
		Query q = getSession().createSQLQuery("select frm.id, frm.materialName, frm.materialQuantity, frm.materialExplanation from faultResultMaterial as frm where frm.faultId = :faultId");
		q.setParameter("faultId", faultId);
		return q.getResultList();
	}
	
	@Override
	public int delbyFaultId(BigInteger faultId) {
		Query q = getSession().createSQLQuery("delete from faultresultmaterial where faultId = :faultId");
		q.setParameter("faultId", faultId);
		return q.executeUpdate();
	}
}
