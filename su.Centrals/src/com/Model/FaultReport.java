package com.Model;

public class FaultReport {
	private String centralName;
	private String deviceName;
	private String techNameSurname;
	private String faultType;
	private String closeDate;
	private String situatedFaults;
	private String fixingWays;
	private String result;
	private String[] matn;
	private String[] matqua;
	private String[] matexp;
	
	public FaultReport() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getCentralName() {
		return centralName;
	}
	public void setCentralName(String centralName) {
		this.centralName = centralName;
	}
	public String getDeviceName() {
		return deviceName;
	}
	public void setDeviceName(String deviceName) {
		this.deviceName = deviceName;
	}
	public String getTechNameSurname() {
		return techNameSurname;
	}
	public void setTechNameSurname(String techNameSurname) {
		this.techNameSurname = techNameSurname;
	}
	public String getFaultType() {
		return faultType;
	}
	public void setFaultType(String faultType) {
		this.faultType = faultType;
	}
	public String getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(String closeDate) {
		this.closeDate = closeDate;
	}
	public String getSituatedFaults() {
		return situatedFaults;
	}
	public void setSituatedFaults(String situatedFaults) {
		this.situatedFaults = situatedFaults;
	}
	public String getFixingWays() {
		return fixingWays;
	}
	public void setFixingWays(String fixingWays) {
		this.fixingWays = fixingWays;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String[] getMatn() {
		return matn;
	}
	public void setMatn(String[] matn) {
		this.matn = matn;
	}
	public String[] getMatqua() {
		return matqua;
	}
	public void setMatqua(String[] matqua) {
		this.matqua = matqua;
	}
	public String[] getMatexp() {
		return matexp;
	}
	public void setMatexp(String[] matexp) {
		this.matexp = matexp;
	}
}
