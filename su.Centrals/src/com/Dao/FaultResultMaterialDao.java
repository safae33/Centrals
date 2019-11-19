package com.Dao;

import java.math.BigInteger;
import java.util.List;

import com.Model.FaultResultMaterial;

@SuppressWarnings("rawtypes")
public interface FaultResultMaterialDao extends BaseDao<FaultResultMaterial, Long> {

	List getFaultResultMaterialByFaultId(BigInteger faultId);

	int delbyFaultId(BigInteger faultId);

	
}
