package com.Dao;

import java.util.List;

import com.Dao.BaseDao;
import com.Model.InputNames;

@SuppressWarnings("rawtypes")
public interface InputNamesDao extends BaseDao<InputNames, Integer>  {

	String GetNameById(int id);
	List GetInputNamesByCentralId(int centralId);
	List GetInputNameIdsByCentralId(int centralId);
	List GetInputNameIdsAndInputNamesByCentralId(int centralId);
	List GetInputNameIdsAndInputNamesByUserName(String userName);
	List getAtGtXwhValuesByInputNameId(int id);
}
