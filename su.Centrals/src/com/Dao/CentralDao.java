package com.Dao;

import java.util.List;

import com.Model.Central;

@SuppressWarnings("rawtypes")
public interface CentralDao extends BaseDao<Central, Integer> {

	boolean checkCentralNameExistence(String centralName);
	String GetCentraNamelById(int id);
	int GetCentralIdByName(String centralName);
	List getAllCentralIdsAndNames();
}
