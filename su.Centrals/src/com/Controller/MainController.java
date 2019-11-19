package com.Controller;

import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.Period;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.beanutils.converters.BigIntegerConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.Dao.CentralDao;
import com.Dao.CustomQuerysDao;
import com.Dao.DetachedFaultsDao;
import com.Dao.FaultResultMaterialDao;
import com.Dao.FaultsDao;
import com.Dao.InputDao;
import com.Dao.InputNamesDao;
import com.Dao.TechnicianNamesDao;
import com.Dao.UserDao;
import com.ExcelViews.Currency;
import com.ExcelViews.CurrencyFactory;
import com.ExcelViews.Moneys;
import com.Model.Central;
import com.Model.DetachedFaults;
import com.Model.FaultReport;
import com.Model.FaultResultMaterial;
import com.Model.Faults;
import com.Model.Input;
import com.Model.User;
import com.Model.InputNames;
import com.Model.TechnicianNames;

import com.Service.Mails;

@SuppressWarnings("rawtypes")
@Controller
@RequestMapping(value="/")

public class MainController {
	
	@Autowired
	private CentralDao centralDao;
	
	@Autowired
	private InputNamesDao inputNamesDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private InputDao inputDao;
	
	@Autowired
	private FaultsDao faultsDao;
	
	@Autowired
	private TechnicianNamesDao techNamesDao;
	
	@Autowired
	private CustomQuerysDao customQeuryDao;
	
	@Autowired
	private FaultResultMaterialDao faultResultMaterialDao;
	
	@Autowired
	private DetachedFaultsDao detachedFaultsDao;

//	@RequestMapping(value = "/report/{centralId}", method = RequestMethod.GET)
//	@ResponseBody
//	public void filtreliRapor(HttpServletResponse response,@PathVariable int centralId) throws JRException, IOException, SQLException {
//		customQeuryDao.reportCentralData(response, centralId);
//	}
		

	@RequestMapping(value= { "/showAll", "/" }, method=RequestMethod.GET)
	private ModelAndView showAll() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("allCentrals", customQeuryDao.getAllCentralsWithStatus());
		mdl.addObject("showAll", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.addObject("yearAndMonths", customQeuryDao.getInputsAllYearsAndMonths());
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/{centralId}", method=RequestMethod.GET)// && p.getDate_().isEqual(LocalDate.now())
	private ModelAndView showCentral(@PathVariable int centralId, @RequestParam boolean all) {
		List today, yesterday, diff = new ArrayList();
		ModelAndView mdl = new ModelAndView();
		if(!all) {
			Object[] o;
			yesterday = customQeuryDao.getDailyInputs(centralId, LocalDate.now().minus(Period.ofDays(1)));
			if(!yesterday.isEmpty()) {
				o = (Object[]) yesterday.get(0);
				mdl.addObject("addTimeY", o[0]);
			}
			mdl.addObject("yesterday", yesterday);

			today = customQeuryDao.getDailyInputs(centralId, LocalDate.now());
			if(!today.isEmpty()) {
				o = (Object[]) today.get(0);
				mdl.addObject("addTimeT", o[0]);
			}
			mdl.addObject("today", today);
			
			if(!(today.isEmpty() || yesterday.isEmpty())) {
				diff = customQeuryDao.getAnalyzeForToday(centralId);
			}
			mdl.addObject("diff", diff);
			mdl.addObject("centralName", centralDao.GetCentraNamelById(centralId));
			mdl.addObject("table", customQeuryDao.getAnalyzeForTodayIfYestOrTodayNull(centralId));
		}
		else {
			mdl.addObject("rows", customQeuryDao.getAllCentralData(centralId));
			mdl.addObject("firstAndLastTime", customQeuryDao.getFirstAndLastInputDate());
			
		}
		mdl.addObject("centralId", centralId);
		mdl.addObject("showCentral", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	
	@RequestMapping(value="/editOrAddInput/{centralId}/{day}", method=RequestMethod.GET)
	private ModelAndView editOrAddInput(@PathVariable String day, @PathVariable int centralId) {
		ModelAndView mdl = new ModelAndView();
		List inputs = null;
		
		mdl.addObject("centralName", centralDao.GetCentraNamelById(centralId));
		if(day.equals("t")) inputs = customQeuryDao.getDailyNameDatum(centralId);
		else inputs = customQeuryDao.getYesterDailyNameDatum(centralId);
		
		if(inputs.size() != 0) {					
			
			mdl.addObject("inputs", inputs);
			mdl.addObject("inputAlready", true);
		}
		else {
			mdl.addObject("inputAlready", false);
			mdl.addObject("inputNames", inputNamesDao.GetInputNamesByCentralId(centralId));
		}
		
		mdl.addObject("day", day);
		mdl.addObject("centralId", centralId);
		mdl.addObject("editOrAddInput", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value= "/newInput/{centralId}/{day}", method=RequestMethod.POST)
	private ModelAndView newInput(@PathVariable String day, @PathVariable int centralId, Authentication auth, HttpServletRequest request) {
		ModelAndView mdl = new ModelAndView();
		List<Integer> inputNameIds = inputNamesDao.GetInputNameIdsByCentralId(centralId);
		Object[] inputNameValues = null;
		int tempInputNameId = 0;
		String[] inputs = request.getParameterValues("input");
		
		CurrencyFactory fac = new CurrencyFactory(Moneys.US_DOLLAR);
	    Currency cur = fac.getCurrency();
		
		Input input = new Input();
		if(day.equals("t")) input.setDate_(LocalDate.now());
		else input.setDate_(LocalDate.now().minus(Period.ofDays(1)));

		input.setTime_(LocalTime.now());
		input.setCentralId(centralId);
		input.setUserId(userDao.GetIdByUserName(auth.getName()));
		input.setDollarCurrency(cur.getSellingPrice());
		for(int i=0; i<inputs.length; i++) {
			tempInputNameId = inputNameIds.get(i);
			inputNameValues = (Object[]) inputNamesDao.getAtGtXwhValuesByInputNameId(tempInputNameId).get(0);
			if(!(boolean) inputNameValues[3]) {
				input.setA_t((int) inputNameValues[0]);
				input.setG_t((int) inputNameValues[1]);
			}
			else {
				input.setA_t(1);
				input.setG_t(1);
			}
			input.setXwh((int) inputNameValues[2]);
			
			input.setInputNameId(tempInputNameId);
			input.setDatum(Long.parseLong(inputs[i]));
			inputDao.create(input);
		}
		
		mdl.setViewName("redirect:/"+centralId+"?all=false");
		return mdl;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value= "/editInput/{centralId}", method=RequestMethod.POST)
	private ModelAndView editInput(@PathVariable int centralId, Authentication auth, HttpServletRequest request) {
		ModelAndView mdl = new ModelAndView();
		List<Integer> inputNameIds = inputNamesDao.GetInputNameIdsByCentralId(centralId);
		int tempInputNameId = 0;
		Input input = null;
		Object[] inputNameValues = null;
		String[] inputs = request.getParameterValues("inputs");
		String[] inputIds = request.getParameterValues("inputIds");
		
		for(int i = 0; i < inputs.length; i++) {
			tempInputNameId = inputNameIds.get(i);
			input = inputDao.read(new BigInteger(inputIds[i]));
			input.setDatum(Integer.parseInt(inputs[i]));
			
			inputNameValues = (Object[]) inputNamesDao.getAtGtXwhValuesByInputNameId(tempInputNameId).get(0);
			if(!(boolean) inputNameValues[3]) {
				input.setA_t((int) inputNameValues[0]);
				input.setG_t((int) inputNameValues[1]);
			}
			else {
				input.setA_t(1);
				input.setG_t(1);
			}
			input.setXwh((int) inputNameValues[2]);
			
			inputDao.update(input);
		}
		
		mdl.setViewName("redirect:/"+centralId+"?all=false");
		return mdl;
	}
	
	// *************************************** S�L�NENLER ***************************************
	@RequestMapping(value="/silinenler", method=RequestMethod.GET)
	private ModelAndView showAllDeleted() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("deletedCentrals", customQeuryDao.getDeletedCentrals());
		mdl.addObject("deletedUsers", customQeuryDao.getUsers(false));
		mdl.addObject("allDeleteds", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	
	// *************************************** TEKNİKER İŞLERİ ***************************************
	@RequestMapping(value="/tech", method=RequestMethod.GET)
	private ModelAndView tech(Authentication auth) {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("faults", customQeuryDao.getAllFaultsByTo_Value(userDao.GetIdByUserName(auth.getName())));
		mdl.addObject("showAllFaults", true);
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(userDao.GetIdByUserName(auth.getName())));
		mdl.setViewName("technician");
		return mdl;
	}
	@RequestMapping(value="/tech/{faultId}", method=RequestMethod.GET)
	private ModelAndView techAriza(@PathVariable BigInteger faultId, Authentication auth) {
		ModelAndView mdl = new ModelAndView();
		faultsDao.changeFaultSeenStatus(faultId, false);
		mdl.addObject("fault", (Object) customQeuryDao.geTechtFaultById(faultId).get(0));
		mdl.addObject("faultResultMaterials", faultResultMaterialDao.getFaultResultMaterialByFaultId(faultId));
		mdl.addObject("showFault", true);
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(userDao.GetIdByUserName(auth.getName())));
		mdl.setViewName("technician");
		return mdl;
	}
	@RequestMapping(value="/tech/closeFault/{faultId}", method=RequestMethod.POST)
	private ModelAndView techArizaSonlandir(Authentication auth, HttpServletRequest request, @PathVariable BigInteger faultId, @RequestParam String result, @RequestParam String situatedFaults, @RequestParam String fixingWays) {
		ModelAndView mdl = new ModelAndView();
		
		Faults fault = faultsDao.read(faultId);
		fault.setClose_date(LocalDate.now());
		fault.setClose_time(LocalTime.now());
		fault.setSituatedFaults(situatedFaults);
		fault.setFixingWays(fixingWays);
		fault.setResult(result);
		fault.setActive(false);
		Mails.sendToAdminWhenFaultClose(techNamesDao.read().stream().filter(p -> p.getUserId() == fault.getTo_()).collect(Collectors.toList()).get(0).getNameAndSurname(), centralDao.read(fault.getCentralId()).getName_());

		faultsDao.update(fault);//fault.getTo_()
			
				
		FaultResultMaterial frm = new FaultResultMaterial();
		frm.setFaultId(faultId);
		String[] materialNames = request.getParameterValues("materialName");
		String[] materialQuantitys = request.getParameterValues("materialQuantity");
		String[] materialExplanations = request.getParameterValues("materialExplanation");
		for(int i = 0; i<materialExplanations.length; i++) {
			frm.setMaterialName(materialNames[i]);
			frm.setMaterialQuantity(materialQuantitys[i]);
			frm.setMaterialExplanation(materialExplanations[i]);
			faultResultMaterialDao.create(frm);
		}
		mdl.addObject("fault", (Object) customQeuryDao.getFaultById(faultId).get(0));
		mdl.addObject("faultResultMaterials", faultResultMaterialDao.getFaultResultMaterialByFaultId(faultId));
		mdl.addObject("showFault", true);
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(userDao.GetIdByUserName(auth.getName())));
		mdl.setViewName("technician");
		return mdl;
	}
	// *************************************** USER İŞLERİ ***************************************
	@RequestMapping(value="/kullanicilar", method=RequestMethod.GET)
	private ModelAndView kullanicilar() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("users", customQeuryDao.getUsers(true));
		mdl.addObject("listUsers", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/teknikerler", method=RequestMethod.GET)
	private ModelAndView teknikerler() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("techs", customQeuryDao.getTechs(true));
		mdl.addObject("listTechs", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/kullaniciEkle", method=RequestMethod.GET)
	private ModelAndView kullaniciEkle() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("addUser", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/sifreDegis", method=RequestMethod.GET)
	private ModelAndView sifreDegis() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("changePassword", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/changeP", method=RequestMethod.POST) 
	private ModelAndView changeP(Authentication auth, @RequestParam String password, @RequestParam String oldPw) {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("changePassword", true);
		mdl.addObject("changePasswordSuccess", userDao.updateUserPassword(auth.getName(), password, oldPw));
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/addU", method=RequestMethod.POST) // @RequestParam String  name_, @RequestParam String surname_, 
	private ModelAndView addU(@ModelAttribute User user, @ModelAttribute TechnicianNames techName) {  //@ModelAttribute Central central
		ModelAndView mdl = new ModelAndView();
		String uName = user.getuName();
		if(!userDao.checkUserNameExistence(uName.toLowerCase())) {
			mdl.addObject("addUserSuccess", true);
			user.setActive(true);
			if(user.getUserType() == 3) {
				user.setCentral(0);
				userDao.create(user);
			}
			if(user.getUserType() == 4) {
				user.setCentral(0);
				techName.setUserId(userDao.create(user));
				techNamesDao.create(techName);
			}
			else {
				user.setMail("yok@yok.com");
				userDao.create(user);
			}
		}
		else {
			mdl.addObject("userAlready", true);
			mdl.addObject("userAlreadyName", uName);
		}
		mdl.addObject("addUser", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/delU/{id}", method=RequestMethod.POST) 
	private ModelAndView delU(@PathVariable int id) {
		ModelAndView mdl = new ModelAndView();
		if(!userDao.checkIfUserAdmin(id)) mdl.addObject("deleteUserSuccess", customQeuryDao.setUserActivity(false, id));
		else mdl.addObject("cantDeleteAdmin", true);
		mdl.addObject("listUsers", true);
		mdl.addObject("users", customQeuryDao.getUsers(true));
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/actU/{id}", method=RequestMethod.POST) 
	private ModelAndView actU(@PathVariable int id) {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("activateUserSuccess", customQeuryDao.setUserActivity(true, id));
		mdl.addObject("listUsers", true);
		mdl.addObject("users", customQeuryDao.getUsers(true));
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	
	
	// *************************************** SANTRAL İŞLERİ ***************************************
	@RequestMapping(value="/santralEkle", method=RequestMethod.GET)
	private ModelAndView santralEkle() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("addCentral", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/addC", method=RequestMethod.POST) 
	private ModelAndView addC(@RequestParam String name_, @RequestParam byte inputNum, HttpServletRequest request) {
		ModelAndView mdl = new ModelAndView();
		if(!centralDao.checkCentralNameExistence(name_.toLowerCase())) {
		InputNames inputName = new InputNames();
		String temp;
		Central central = new Central(name_, inputNum, true);

		Integer centralId = centralDao.create(central);
		
		inputName.setCentralId(centralId);
		String[] inputs = request.getParameterValues("input");
		for(int i=0; i<inputs.length; i++) {
			temp = inputs[i];
			if(temp == "") temp = "GES-" + (i+1); //burada inin +1 ini kullanmak zorunda oldu�um i�in foreach �eklnde kullanmad�m
			inputName.setInputName(temp);
			inputName.setA_t(3);
			inputName.setG_t(330);
			inputName.setXwh(10000);
			inputNamesDao.create(inputName);
		}
		mdl.addObject("addCentralSuccess", true);
		}
		else {
			mdl.addObject("centralAlready", true);
		}
		mdl.addObject("addCentral", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/delC/{centralId}", method=RequestMethod.POST) 
	private ModelAndView delC(@PathVariable int centralId) {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("deleteCentralSuccess", customQeuryDao.setCentralActivity(false, centralId));
		mdl.addObject("showAll", true);
		mdl.addObject("allCentrals", customQeuryDao.getAllCentralsWithStatus());
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value="/actC/{centralId}", method=RequestMethod.POST) 
	private ModelAndView actC(@PathVariable int centralId) {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("activateCentralSuccess", customQeuryDao.setCentralActivity(true, centralId));
		mdl.addObject("showAll", true);
		mdl.addObject("allCentrals", customQeuryDao.getAllCentralsWithStatus());
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	
	
	// *************************************** AJAX KISIMLARI ***************************************
	@RequestMapping(value="/updInpAttr", method=RequestMethod.POST)
	@ResponseBody
	private String updInpAttr(@RequestParam String central, @RequestParam String inputName, @RequestParam String attr, @RequestParam int value){
		customQeuryDao.updateInputAttribute(central, inputName, attr, value);
		if(attr.equals("xwh")) customQeuryDao.updateInputAttributeREALLYiNPUTaTTR(central, inputName, value);
		return "T";
	}
	@RequestMapping(value="/changeGKC", method=RequestMethod.POST)
	@ResponseBody
	private String changeGKC(@RequestParam int inputNameId){
		customQeuryDao.gkcCheckedChgange(inputNameId);
		return "T";
	}
	@RequestMapping(value="/isAllowToOwner", method=RequestMethod.POST)
	@ResponseBody
	private String isAllowToOwner(@RequestParam int faultId){
		customQeuryDao.isAllowToOwnerChange(faultId);
		return "T";
	}
	
	// *************************************** ARIZA KISIMLARI ***************************************
	@RequestMapping(value= "/arizalar", method=RequestMethod.GET)
	private ModelAndView arizalar() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("faults", customQeuryDao.getAllFaultsByTo_Value(0));
		mdl.addObject("faultsFromAdmin", customQeuryDao.getAllFaultsByFrom_Admin());
		mdl.addObject("showAllFaults", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/ariza/{faultId}", method=RequestMethod.GET)
	private ModelAndView ariza(@PathVariable BigInteger faultId) {
		ModelAndView mdl = new ModelAndView();
		if(customQeuryDao.checkFaultTo_IsAdmin(faultId)) faultsDao.changeFaultSeenStatus(faultId, false);
		mdl.addObject("fault", (Object) customQeuryDao.getFaultById(faultId).get(0));
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.addObject("detachedFault", detachedFaultsDao.getFromAdminByToAdmin(faultId));
		mdl.addObject("showFault", true);
		mdl.setViewName("showAll");
		return mdl;
	}             
	@RequestMapping(value= "/techAriza/{faultId}", method=RequestMethod.GET)
	private ModelAndView techArizaAdmin(@PathVariable BigInteger faultId) {
		ModelAndView mdl = new ModelAndView();
		if(customQeuryDao.checkFaultTo_IsAdmin(faultId)) faultsDao.changeFaultSeenStatus(faultId, false);
		mdl.addObject("fault", (Object) customQeuryDao.geTechtFaultById(faultId).get(0));
		mdl.addObject("faultResultMaterials", faultResultMaterialDao.getFaultResultMaterialByFaultId(faultId));
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.addObject("detachedFault", detachedFaultsDao.getToAdminByFromAdmin(faultId));
		mdl.addObject("showTechFault", true);
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/closeFault/{faultId}", method=RequestMethod.POST)
	private ModelAndView closeFault(@PathVariable BigInteger faultId, @RequestParam String result) {
		ModelAndView mdl = new ModelAndView();
		Faults fault = faultsDao.read(faultId);
		fault.setResult(result);
		fault.setClose_date(LocalDate.now());
		fault.setClose_time(LocalTime.now());
		fault.setActive(false);
		faultsDao.update(fault);
		mdl.addObject("fault", (Object) customQeuryDao.getFaultById(faultId).get(0));
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("detachedFault", detachedFaultsDao.getFromAdminByToAdmin(faultId));
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.addObject("showFault", true);
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/arizaTipiEkle", method=RequestMethod.GET)
	private ModelAndView arizaTipiEkle() {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("faultTypes", customQeuryDao.getAllFaultTypes());
		mdl.addObject("addFaultType", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/addF", method=RequestMethod.POST)
	private ModelAndView addF(@RequestParam String faultName) {
		ModelAndView mdl = new ModelAndView();
		if(!customQeuryDao.checkFaultTypeExistence(faultName)) {
		mdl.addObject("addFaultTypeSuccess", customQeuryDao.addNewFaultType(faultName));
		}
		else mdl.addObject("faultTypeAlready", true);
		mdl.addObject("faultTypes", customQeuryDao.getAllFaultTypes());
		mdl.addObject("addFaultType", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/delF/{faultId}", method=RequestMethod.POST)
	private ModelAndView delF(@PathVariable int faultId) {
		ModelAndView mdl = new ModelAndView();
		try {
			mdl.addObject("deleteFaultTypeSuccess", customQeuryDao.deleteFaultType(faultId));
        } catch (org.hibernate.exception.ConstraintViolationException hata) {
        	mdl.addObject("faultUsageException", true);
        }
		
		mdl.addObject("faultTypes", customQeuryDao.getAllFaultTypes());
		mdl.addObject("addFaultType", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/arizaEkle", method=RequestMethod.GET)
	private ModelAndView addFault(HttpServletRequest request) { //@RequestParam int faultId
		ModelAndView mdl = new ModelAndView();
		try {
			int faultId = Integer.parseInt(request.getParameter("faultId"));
			mdl.addObject("faultSpecs", (Object)customQeuryDao.forDetachgetFaultById(faultId).get(0));
			mdl.addObject("detach", true);
        } catch (java.lang.NumberFormatException hata) {
        	mdl.addObject("faultTypes", customQeuryDao.getAllFaultTypes());
    		mdl.addObject("centralsForFault", centralDao.getAllCentralIdsAndNames());
        }
		mdl.addObject("technicians", customQeuryDao.getAllTechniciansWithNameSurname());
		mdl.addObject("addFault", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/addFault/{faultId}", method=RequestMethod.POST)
	private ModelAndView addFaultDetached(@ModelAttribute Faults fault, @PathVariable BigInteger faultId) { //, @RequestParam int inputNameId, @RequestParam int centralId, @RequestParam int faultType, @RequestParam int to_, @RequestParam String comment
		ModelAndView mdl = new ModelAndView();
		
		fault.setFrom_(0);
		fault.setOpen_date(LocalDate.now());
		fault.setOpen_time(LocalTime.now());
		fault.setActive(true);
		fault.setNew(true);
		
		detachedFaultsDao.create(new DetachedFaults(faultId ,faultsDao.create(fault)));
		
		Mails.sendToTech(userDao.read(fault.getTo_()).getMail());

		mdl.addObject("addFault", true);
		mdl.addObject("addFaultSuccess", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/addFault", method=RequestMethod.POST)
	private ModelAndView addFault(@ModelAttribute Faults fault) { //, @RequestParam int inputNameId, @RequestParam int centralId, @RequestParam int faultType, @RequestParam int to_, @RequestParam String comment
		ModelAndView mdl = new ModelAndView();
		
		fault.setFrom_(0);
		fault.setOpen_date(LocalDate.now());
		fault.setOpen_time(LocalTime.now());
		fault.setActive(true);
		fault.setNew(true);
		faultsDao.create(fault);
		
		Mails.sendToTech(userDao.read(fault.getTo_()).getMail());

		mdl.addObject("addFault", true);
		mdl.addObject("addFaultSuccess", true);
		mdl.addObject("centrals", getCentrals());
		mdl.addObject("newFaultCheck", customQeuryDao.checkNewFaultRecorForUser(0));
		mdl.setViewName("showAll");
		return mdl;
	}
	@RequestMapping(value= "/delFault/{faultId}/{toAdmin}", method=RequestMethod.POST)
	private ModelAndView delFault(@PathVariable BigInteger faultId, @PathVariable boolean toAdmin) throws Exception { //, @RequestParam int inputNameId, @RequestParam int centralId, @RequestParam int faultType, @RequestParam int to_, @RequestParam String comment
		ModelAndView mdl = new ModelAndView();
		if(toAdmin) detachedFaultsDao.delByToAdminId(faultId);
		else detachedFaultsDao.delByFromAdminId(faultId);
		try {
			faultResultMaterialDao.delbyFaultId(faultId);
		}
		catch(Exception e) {}
		faultsDao.deletePK(faultId);

		mdl.setViewName("redirect:/arizalar");
		return mdl;
	}
	
	
	
	@RequestMapping(value= "/login", method=RequestMethod.GET)
	private ModelAndView login() {
		ModelAndView mdl = new ModelAndView();
		
		mdl.setViewName("login");
		return mdl;
	}
	

	@RequestMapping(value= "/addInput/{centralId}", method=RequestMethod.GET)
	private ModelAndView addInput(@PathVariable int centralId, Authentication auth){
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("add", true);
		mdl.addObject("addinputReally", true);
		if(centralId == Integer.parseInt(userDao.GetCentralByUserName(auth.getName()))) {
			mdl.addObject("showInputPage", true);
		
			mdl.addObject("centralName", centralDao.GetCentraNamelById(centralId));
			List inputs = customQeuryDao.getDailyNameDatum(centralId);	
			if(inputs.size() != 0) {					
				
				mdl.addObject("inputs", inputs);
				mdl.addObject("inputAlready", true);
			}
			else {
				mdl.addObject("inputAlready", false);
				mdl.addObject("centralId", centralId);
				mdl.addObject("inputNames", inputNamesDao.GetInputNamesByCentralId(centralId));
			}	
		}
		mdl.setViewName("addInput");
		return mdl;
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value= "/addI/{centralId}", method=RequestMethod.POST)
	private ModelAndView addI(@PathVariable int centralId, Authentication auth, HttpServletRequest request) {
		ModelAndView mdl = new ModelAndView();
		List<Integer> inputNameIds = inputNamesDao.GetInputNameIdsByCentralId(centralId);
		Object[] inputNameValues = null;
		int tempInputNameId = 0;
		String[] inputs = request.getParameterValues("input");
		CurrencyFactory fac = new CurrencyFactory(Moneys.US_DOLLAR);
	    Currency cur = fac.getCurrency();
	    boolean[] checks;
	    try {
	    	checks = checkDataAppropriately(inputs, inputNameIds);
	    }
	    catch (IndexOutOfBoundsException e) {
	    	checks = new boolean[]{false};
		}
	    
	    if(areAllFalse(checks)) {
			Input input = new Input();
			input.setDate_(LocalDate.now());
			input.setTime_(LocalTime.now());
			input.setCentralId(centralId);
			input.setUserId(userDao.GetIdByUserName(auth.getName()));
			input.setDollarCurrency(cur.getSellingPrice());
			for(int i=0; i<inputs.length; i++) {
				tempInputNameId = inputNameIds.get(i);
				inputNameValues = (Object[]) inputNamesDao.getAtGtXwhValuesByInputNameId(tempInputNameId).get(0);
				if(!(boolean) inputNameValues[3]) {
					input.setA_t((int) inputNameValues[0]);
					input.setG_t((int) inputNameValues[1]);
				}
				else {
					input.setA_t(1);
					input.setG_t(1);
				}
				input.setXwh((int) inputNameValues[2]);
				input.setInputNameId(tempInputNameId);
				input.setDatum(Long.parseLong(inputs[i]));
				inputDao.create(input);
			}
	    }
	    else {
	    	mdl.addObject("dataFaultCheck", true);
//	    	mdl.addObject("dataFaultArray", checks);
	    }
		
		
		mdl.setViewName("redirect:/addInput/"+centralId);
		return mdl;
	}
	@RequestMapping(value= "/arizaBildirimi", method=RequestMethod.GET)
	private ModelAndView arizaBildirimi(Authentication auth) {
		ModelAndView mdl = new ModelAndView();
		mdl.addObject("centralId", Integer.parseInt(userDao.GetCentralByUserName(auth.getName())));
		mdl.addObject("showInputPage", true);
		mdl.addObject("faults", customQeuryDao.getAllFaultsByFrom_Value(userDao.GetIdByUserName(auth.getName())));
		mdl.addObject("faultTypes", customQeuryDao.getAllFaultTypes());
		mdl.addObject("devices", inputNamesDao.GetInputNameIdsAndInputNamesByUserName(auth.getName()));
		mdl.addObject("addFaultForAdmin", true);
		mdl.setViewName("addInput");
		return mdl;
	}
	@RequestMapping(value= "/addFaultForAdminPost", method=RequestMethod.POST)
	private ModelAndView addFaultForAdminPost(Authentication auth, @RequestParam String comments, @RequestParam int inputNameId, @RequestParam int faultType) {
		ModelAndView mdl = new ModelAndView();
		Faults fault = new Faults(inputNameId, faultType, comments);
		String userName = auth.getName();
		fault.setFrom_(userDao.GetIdByUserName(userName));
		fault.setTo_(0);
		fault.setCentralId(userDao.getCentralIdByUserName(userName));
		fault.setOpen_date(LocalDate.now());
		fault.setOpen_time(LocalTime.now());
		fault.setActive(true);
		fault.setNew(true);
		
		faultsDao.create(fault);
		mdl.setViewName("redirect:/arizaBildirimi");
		return mdl;
	}
	
	
	
	
	
	
	
	@RequestMapping(value= "/showToOwner", method=RequestMethod.GET)
	private ModelAndView showCentraltoOwner(Authentication auth) {
		ModelAndView mdl = new ModelAndView();
		int centralId = Integer.parseInt(userDao.GetCentralByUserName(auth.getName()));
		mdl.addObject("rows", customQeuryDao.getAllCentralData(centralId));

		mdl.addObject("showCentralThings", true);
		mdl.addObject("showPage", true);
		mdl.setViewName("showToOwner");
		return mdl;
	}
	@RequestMapping(value= "/santralArizalari", method=RequestMethod.GET)
	private ModelAndView santralArizalari(Authentication auth) {
		ModelAndView mdl = new ModelAndView();
		
		mdl.addObject("faults", customQeuryDao.getAllFaultsByCentralIdAndIfAllowed(Integer.parseInt(userDao.GetCentralByUserName(auth.getName()))));
		mdl.addObject("faultsShowToOwner", true);
		mdl.addObject("showPage", true);
		mdl.setViewName("showToOwner");
		return mdl;
	}
	@RequestMapping(value= "/santralArizalari/{faultId}", method=RequestMethod.GET)
	private ModelAndView santralArizalariSingle(Authentication auth, @PathVariable BigInteger faultId) {
		ModelAndView mdl = new ModelAndView();

		mdl.addObject("fault", (Object) customQeuryDao.geTechtFaultById(faultId).get(0));
		mdl.addObject("faultResultMaterials", faultResultMaterialDao.getFaultResultMaterialByFaultId(faultId));
	
		mdl.addObject("faultShowToOwner", true);
		mdl.addObject("showPage", true);
		mdl.setViewName("showToOwner");
		return mdl;
	}
	
	
	
	
	/*@RequestMapping(value= "/rapor", method=RequestMethod.POST)
	private String rapor(Model model, @ModelAttribute Faults fault) {
		model.addAttribute("deneme", fault);
		return "testExcel";
	}*/
	
	@RequestMapping(value= "/servisRaporu", method=RequestMethod.POST)
	private String servisRaporu(Model model, FaultReport faultReport) {
		model.addAttribute("faultReport", faultReport);
		return "servisRaporuOlustur";
	}
	@RequestMapping(value= "/aylikUretimRaporu", method=RequestMethod.POST)
	private String aylikUretimRaporu(Model model, @RequestParam String yearMonthSelect) {
		model.addAttribute("yearMonthSelect", yearMonthSelect);
		return "aylikÜretimRaporuOlustur";
	}
	
	@RequestMapping(value="/accessDenied", method=RequestMethod.GET)
	private ModelAndView accessDenied(Authentication auth) {
		ModelAndView mdl = new ModelAndView();
		System.out.println("dinayyyydddd");
		mdl.addObject("showPage", false);
		mdl.setViewName("showToOwner");
		return mdl;
	}
	
	private List getCentrals() {
		return centralDao.read().stream().filter(p -> p.getId() != 0 && p.isActive()).collect(Collectors.toList());
	}
	
	private boolean[] checkDataAppropriately(String[] data, List<Integer> inputNameIds) {
		boolean[] checks = new boolean[data.length];
		BigInteger oldData;
		int check1, check2;
		for(int i = 0; i < data.length; i++) {
			oldData = customQeuryDao.getSingleDatum(inputNameIds.get(i));
			check1 = oldData.compareTo(new BigInteger(data[i]));
			check2 = new BigInteger(data[i]).subtract(oldData).compareTo(new BigInteger("15000"));
			if( check1 == 1 || check2 == 1)   {
				checks[i] = true;
			}
			else checks[i] = false;
		}
		return checks;
	}
	public static boolean areAllFalse(boolean[] array)
	{
	    for(boolean b : array) if(b) return false;
	    return true;
	}
}
