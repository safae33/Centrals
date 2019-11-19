package com.Dao;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.List;


@SuppressWarnings("rawtypes")
public interface CustomQuerysDao {
	
	List getDailyInputs(int centralId, LocalDate ldt);
	List getAnalyzeForToday(int centralId);
	List getAllCentralsWithStatus();
	List getUsers(boolean status);
	List getTechs(boolean status);
	List getDeletedCentrals();
	int setUserActivity(boolean status, int id);
	int setCentralActivity(boolean status, int centralId);
	List getAllCentralData(int centralId);
	List getDailyNameDatum(int centralId);
	List getAllFaultsByTo_Value(int to_);
	List getFaultById(BigInteger faultId);
	List forDetachgetFaultById(int id);
	List getAllFaultTypes();
	int addNewFaultType(String faultName);
	boolean checkFaultTypeExistence(String faultName);
	int deleteFaultType(int faultId);
	List getAllTechniciansWithNameSurname();
	int updateInputAttribute(String central, String inputName, String attr, int value);
	List getAllFaultsByFrom_Value(int from_);
	List getAllFaultsByFrom_Admin();
	boolean checkFaultTo_IsAdmin(BigInteger arizaId);
	boolean checkNewFaultRecorForUser(int to_);
	List geTechtFaultById(BigInteger id);
	List getInputsAllYearsAndMonths();
	List getFirstAndLastInputDate();
	int updateInputAttributeREALLYiNPUTaTTR(String central, String inputName, int value);
	List checkAllDailyOk();
	List getDailyWattSumsByCentralId(int centralId, LocalDate date, LocalDate date_1);
	List getYesterDailyNameDatum(int centralId);
	List getAnalyzeForTodayIfYestOrTodayNull(int centralId);
	List getLeastNameDatum(int centralId);
	int gkcCheckedChgange(int inputNameId);
	int isAllowToOwnerChange(int faultId);
	List getAllFaultsByCentralIdAndIfAllowed(int centralId);
	BigInteger getSingleDatum(int inputNameId);
	
}
