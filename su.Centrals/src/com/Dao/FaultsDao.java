package com.Dao;

import java.math.BigInteger;

import com.Model.Faults;

public interface FaultsDao extends BaseDao<Faults, BigInteger> {
	int changeFaultSeenStatus(BigInteger faultId, boolean status);
}
