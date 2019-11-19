package com.Dao.Impl;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.CustomQuerysDao;


@EnableTransactionManagement
@Transactional
@Repository
@SuppressWarnings("rawtypes")
public class CustomQuerysDaoImpl implements CustomQuerysDao{
	
	@Autowired
    private SessionFactory sessionFactory;
			
	protected Session getSession() {
        Session session = sessionFactory.getCurrentSession();
        return session;
    }

	@Override
	public List getDailyInputs(int centralId, LocalDate ldt) {
		Query q = getSession().createSQLQuery("select inp.time_, inpName.inputName, us.uName, inp.datum, inp.id from inputs inp inner join InputNames inpName on inp.InputNameId = inpName.id inner join Users us on inp.userId = us.id WHERE inp.centralId = :centralId and inp.date_ = :ldt order by(inpName.id)");
		q.setParameter("centralId", centralId);
		q.setParameter("ldt", ldt);
		return q.getResultList();
	}

	@Override
	public List getAnalyzeForToday(int centralId) {
		Query q = getSession().createSQLQuery("select distinct inpN.inputName, ((select datum from inputs where inputnameid = inpN.id and date_ = current_date)-(select datum from inputs where inputnameid = inpN.id and date_ = current_date-1)), inpN.a_t, inpN.g_t, inpN.xwh, inpN.id, inpN.gkc from inputs as inp inner join inputnames as inpN on inp.inputnameid = inpN.id where inp.centralid = :centralId and inp.date_ = current_date order by inpN.id");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}
	
	@Override
	public List getAnalyzeForTodayIfYestOrTodayNull(int centralId) {
		Query q = getSession().createSQLQuery("select distinct inpN.inputName, inpN.a_t, inpN.g_t, inpN.xwh, inpN.id, inpN.gkc from inputnames as inpN where inpN.centralid = :centralId order by inpN.id");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}
	
	@Override
	public List getDailyWattSumsByCentralId(int centralId, LocalDate date, LocalDate date_1) {
		Query q = getSession().createSQLQuery("select concat(CAST(inp.centralid as text), '. Santral ', inp.date_, ' için') as name_, sum((((select datum from inputs as inp1 where inp1.inputnameid = inp.inputnameid and date_ = :date)-(select datum from inputs as inp1 where inp1.inputnameid = inp.inputnameid and date_ = :date_1))*inp.a_t*inp.g_t) / 1000), inp.dollarCurrency from inputs as inp where inp.centralId = :centralId and inp.date_ = :date group by name_, inp.dollarCurrency");
		q.setParameter("centralId", centralId);
		q.setParameter("date", date);
		q.setParameter("date_1", date_1);
		return q.getResultList();
	}

	@Override
	public List getAllCentralsWithStatus() {
		Query q = getSession().createSQLQuery("select distinct cen.id, cen.name_, inp.time_, "
				+ "case when inp.time_ is not null then true else false end "
				+ "from Centrals as cen "
				+ "left join inputs as inp on cen.id = inp.centralid and inp.date_ = current_date "
				+ "where cen.isactive order by cen.id");
		return q.getResultList();
	}

	@Override
	public List getUsers(boolean status) {
		Query q = getSession().createSQLQuery("select us.uName, us.password_, case when us.userType = 3 then 'YÖNETİCİ' when us.userType = 2 then 'SANTRAL SAHİBİ' when us.userType = 1 then 'SANTRAL SORUMLUSU' end, cent.name_, us.id, us.mail from users as us inner join centrals as cent on us.central = cent.id where us.isactive = :status and us.userType != 4 and us.id != 0");
		q.setParameter("status", status);
		return q.getResultList();
	}
	
	@Override
	public List getTechs(boolean status) {
		Query q = getSession().createSQLQuery("select us.id, row_number() over(order by tek.name_, tek.surname_) as Sat�r, concat(tek.name_,' ',tek.surname_) as adSoyad, us.uName, us.password_, us.mail from users as us inner join technicianNames as tek on us.id = tek.userId where us.isActive = :status");
		q.setParameter("status", status);
		return q.getResultList();
	}

	@Override
	public int setUserActivity(boolean status, int id) {
		Query q = getSession().createSQLQuery("update users set isactive = :status where id = :id");
		q.setParameter("status", status);
		q.setParameter("id", id);
		return q.executeUpdate();
	}
	
	@Override
	public int setCentralActivity(boolean status, int centralId) {
		Query q = getSession().createSQLQuery("update centrals set isactive = :status where id = :id");
		q.setParameter("status", status);
		q.setParameter("id", centralId);
		return q.executeUpdate();
	}

	@Override
	public List getAllCentralData(int centralId) {
		Query q = getSession().createSQLQuery("select row_number() over(order by inp.date_ desc, inpN.id) as Satır, inpN.inputName, us.uName, inp.date_, inp.time_, COALESCE(((select datum from inputs where inputnameid = inpN.id and date_ = inp.date_)-(select datum from inputs where inputnameid = inpN.id and date_ = inp.date_-1)),((select datum from inputs where inputnameid = inpN.id and date_ = inp.date_)-(select datum from inputs where inputnameid = inpN.id and date_ = inp.date_-2)),((select datum from inputs where inputnameid = inpN.id and date_ = inp.date_)-(select datum from inputs where inputnameid = inpN.id and date_ = inp.date_-3)),((select datum from inputs where inputnameid = inpN.id and date_ = inp.date_)-(select datum from inputs where inputnameid = inpN.id and date_ = inp.date_-4)),((select datum from inputs where inputnameid = inpN.id and date_ = inp.date_)-(select datum from inputs where inputnameid = inpN.id and date_ = inp.date_-5)), 0) as datum_diff, inp.datum, cen.name_, cen.id,inp.a_t, inp.g_t, inp.xwh from inputs as inp inner join inputNames as inpN on inp.InputNameId = inpN.id inner join Users as us on inp.userId = us.id inner join centrals as cen on inp.centralId = cen.id where inp.centralId = :centralId order by inp.date_ desc, inpN.id");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}

	@Override
	public List getDeletedCentrals() {
		Query q = getSession().createSQLQuery("select cen.id, cen.name_ from centrals as cen where not cen.isactive and cen.id != 0");
		return q.getResultList();
	}
	
	@Override
	public List getLeastNameDatum(int centralId) {
		Query q = getSession().createSQLQuery("select inpN.inputname, inp.datum, inp.id from inputs as inp inner join inputnames as inpN on inp.inputnameid = inpN.id where inp.centralid = :centralId and inp.date_ = current_date");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}
	
	@Override
	public BigInteger getSingleDatum(int inputNameId) {
		Query q = getSession().createSQLQuery("select datum from inputs where inputnameid = :inputNameId and date_ = current_date-1");
		q.setParameter("inputNameId", inputNameId);
		return (BigInteger) q.getResultList().get(0);
	}

	@Override
	public List getDailyNameDatum(int centralId) {
		Query q = getSession().createSQLQuery("select inpN.inputname, inp.datum, inp.id from inputs as inp inner join inputnames as inpN on inp.inputnameid = inpN.id where inp.centralid = :centralId and inp.date_ = current_date order by inpN.id");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}
	@Override
	public List getYesterDailyNameDatum(int centralId) {
		Query q = getSession().createSQLQuery("select inpN.inputname, inp.datum, inp.id from inputs as inp inner join inputnames as inpN on inp.inputnameid = inpN.id where inp.centralid = :centralId and inp.date_ = current_date-1 order by inpN.id");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}

	@Override
	public List getAllFaultsByTo_Value(int to_) {
		Query q = getSession().createSQLQuery("select row_number() over(order by f.isActive desc, f.isNew desc) as Sat�r, cen.name_, us.uName, ftype.faultName, f.isActive, f.isNew, f.id, f.open_date from faults as f inner join centrals as cen on f.centralId = cen.id inner join Users as us on f.from_ = us.id inner join faultTypes as ftype on f.faultType = ftype.id where to_ = :to_");
		q.setParameter("to_", to_);
		return q.getResultList();
	}
	
	@Override
	public List getAllFaultsByFrom_Value(int from_) {
		Query q = getSession().createSQLQuery("select row_number() over(order by f.isActive desc, f.isNew desc) as Sat�r, cen.name_, us.uName, ftype.faultName, f.isActive, f.isNew, f.id, f.open_date from faults as f inner join centrals as cen on f.centralId = cen.id inner join Users as us on f.from_ = us.id inner join faultTypes as ftype on f.faultType = ftype.id where from_ = :from_");
		q.setParameter("from_", from_);
		return q.getResultList();
	}
	
	@Override
	public List getAllFaultsByCentralIdAndIfAllowed(int centralId) {
		Query q = getSession().createSQLQuery("select f.id, row_number() over(order by f.isActive desc, f.isNew desc) as Satır, us.uName, concat(tek.name_,' ',tek.surname_) as adSoyad, cen.name_, ftype.faultName, f.open_date, f.open_time, f.isActive, f.isNew, f.isAllowToOwner from faults as f inner join centrals as cen on f.centralId = cen.id inner join Users as us on f.to_ = us.id inner join TechnicianNames as tek on tek.userId = us.id inner join faultTypes as ftype on f.faultType = ftype.id where f.centralId = :centralId and f.isAllowToOwner = true");
		q.setParameter("centralId", centralId);
		return q.getResultList();
	}
	
	@Override
	public List getAllFaultsByFrom_Admin() {
		Query q = getSession().createSQLQuery("select f.id, row_number() over(order by f.isActive desc, f.isNew desc) as Satır, us.uName, concat(tek.name_,' ',tek.surname_) as adSoyad, cen.name_, ftype.faultName, f.open_date, f.open_time, f.isActive, f.isNew, f.isAllowToOwner from faults as f inner join centrals as cen on f.centralId = cen.id inner join Users as us on f.to_ = us.id inner join TechnicianNames as tek on tek.userId = us.id inner join faultTypes as ftype on f.faultType = ftype.id");
		return q.getResultList();
	}
	
	@Override
	public boolean checkFaultTo_IsAdmin(BigInteger faultId) {
		Query q = getSession().createSQLQuery("select case when count(*) = 0 then false else true end from faults as f inner join users as us on f.to_ = us.id where f.id = :faultId and us.id = 0");
		q.setParameter("faultId", faultId);
		return (boolean) q.getResultList().get(0);
	}

	@Override
	public boolean checkNewFaultRecorForUser(int to_) {
		Query q = getSession().createSQLQuery("select case when count(*) = 0 then false else true end from faults as f where f.to_ = :to_ and f.isnew = true");
		q.setParameter("to_", to_);
		return (boolean) q.getResultList().get(0);
	}			
	@Override
	public List getAllFaultTypes() {
		Query q = getSession().createSQLQuery("select id, faultName from faultTypes");
		return q.getResultList();
	}

	@Override
	public int addNewFaultType(String faultName) {
		Query q = getSession().createSQLQuery("insert into faulttypes(faultName) values(:faultName)");
		q.setParameter("faultName", faultName);
		return q.executeUpdate();
	}

	@Override
	public boolean checkFaultTypeExistence(String faultName) {
		Query q = getSession().createSQLQuery("select case when count(*) = 0 then false else true end from faultTypes where lower(faultName) = :faultName");
		q.setParameter("faultName", faultName);
		return (boolean) q.getResultList().get(0);
	}

	@Override
	public int deleteFaultType(int faultId) {
		Query q = getSession().createSQLQuery("delete from FaultTypes where id = :faultId");
		q.setParameter("faultId", faultId);
		return q.executeUpdate();
	}

	@Override
	public List getFaultById(BigInteger id) {
		Query q = getSession().createSQLQuery("select f.id, cen.name_, inpNames.inputName, us.uName, ftype.faultName, f.isActive, f.open_date, f.open_time, f.close_date, f.close_time, f.comment, f.result, f.isdetached, f.situatedFaults, f.fixingWays from faults as f inner join centrals as cen on f.centralId = cen.id inner join Users as us on f.from_ = us.id inner join faultTypes as ftype on f.faultType = ftype.id inner join InputNames as inpNames on f.inputNameId = inpNames.id where f.id = :id");
		q.setParameter("id", id);
		return q.getResultList();
	}
	@Override
	public List geTechtFaultById(BigInteger id) {
		Query q = getSession().createSQLQuery("select f.id, cen.name_, inpNames.inputName, concat(tek.name_,' ',tek.surname_) as adSoyad, ftype.faultName, f.isActive, f.open_date, f.open_time, f.close_date, f.close_time, f.comment, f.result, f.isdetached, f.situatedFaults, f.fixingWays from faults as f inner join centrals as cen on f.centralId = cen.id inner join TechnicianNames as tek on f.to_ = tek.userId inner join faultTypes as ftype on f.faultType = ftype.id inner join InputNames as inpNames on f.inputNameId = inpNames.id where f.id = :id");
		q.setParameter("id", id);
		return q.getResultList();
	}
	
	@Override
	public List getAllTechniciansWithNameSurname() {
		return getSession().createSQLQuery("select us.id, tech.name_, tech.surname_ from users as us inner join techniciannames as tech on us.id = tech.userId").getResultList();
	}
	
	@Override
	public int gkcCheckedChgange(int inputNameId) {
		Query q = getSession().createSQLQuery("UPDATE inputnames SET gkc = NOT gkc WHERE id = :inputNameId");
		q.setParameter("inputNameId", inputNameId);
		return q.executeUpdate();
	}
	@Override
	public int isAllowToOwnerChange(int faultId) {
		Query q = getSession().createSQLQuery("UPDATE faults SET isAllowToOwner = NOT isAllowToOwner WHERE id = :faultId");
		q.setParameter("faultId", faultId);
		return q.executeUpdate();
	}

	@Override
	public int updateInputAttribute(String central, String inputName, String attr, int value) {
		Query q = getSession().createSQLQuery("update inputNames set " + attr +" = :value where inputName = :inputName and centralId = (select id from centrals where name_ = :central)");

		q.setParameter("central", central);
		q.setParameter("inputName", inputName);
		q.setParameter("value", value);
		return q.executeUpdate();
	}
	@Override
	public int updateInputAttributeREALLYiNPUTaTTR(String central, String inputName, int value) {
		Query q = getSession().createSQLQuery("update inputs set xwh = :value where inputNameid = (select id from inputNames where inputName = :inputName and centralId = (select id from centrals where name_ = :central))");

		q.setParameter("central", central);
		q.setParameter("inputName", inputName);
		q.setParameter("value", value);
		return q.executeUpdate();
	}

	@Override
	public List forDetachgetFaultById(int id) {
		Query q = getSession().createSQLQuery("select f.faultType, ft.faultName, f.centralId, cen.name_, f.inputNameId, inpN.inputName, f.id from faults as f inner join faultTypes as ft on f.faulttype = ft.id inner join centrals as cen on f.centralId = cen.id inner join inputnames as inpN on f.inputnameId = inpN.id where f.id = :id");
		q.setParameter("id", id);
		return q.getResultList();
	}
	
	@Override
	public List getInputsAllYearsAndMonths() {
		return getSession().createSQLQuery("select distinct to_char(date_, 'YYYY-Month') as tarih from inputs order by tarih desc").getResultList();
	}
	
	@Override
	public List getFirstAndLastInputDate() {
		return getSession().createSQLQuery("select min(to_char(date_, 'YYYY-MM-DD')), max(to_char(date_, 'YYYY-MM-DD')) from inputs").getResultList();
	}
	
	@Override
	public List checkAllDailyOk() {
		return getSession().createSQLQuery("select case when count(*) = 0 then false else true end from inputs").getResultList();
	}
	
	
}
