package com.Model;

import java.io.Serializable;
import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.*;

@Entity
@Table(name="Faults")
public class Faults implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "faults_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "faults_id_seq", sequenceName = "faults_id_seq", initialValue = 1, allocationSize = 1)
	private BigInteger id;
	private int from_;
	private int to_;
	private int centralId;
	private int inputNameId;
	private int faultType;
	private LocalDate open_date;
	private LocalTime open_time;
	private LocalDate close_date;
	private LocalTime close_time;
	private String comment;
	private String result;
	private String situatedFaults;
	private String fixingWays;
	private boolean isActive;
	private boolean isNew;
	public boolean isDetached() {
		return isDetached;
	}
	public void setDetached(boolean isDetached) {
		this.isDetached = isDetached;
	}
	public boolean isAllowToOwner() {
		return isAllowToOwner;
	}
	public void setAllowToOwner(boolean isAllowToOwner) {
		this.isAllowToOwner = isAllowToOwner;
	}


	private boolean isDetached;
	private boolean isAllowToOwner = false;
	public Faults(int to_, int centralId, int inputNameId, int faultType, String comment) {
		super();
		this.to_ = to_;
		this.centralId = centralId;
		this.inputNameId = inputNameId;
		this.faultType = faultType;
		this.comment = comment;
	}
	public Faults() {
		super();
		// TODO Auto-generated constructor stub
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


	public BigInteger getId() {
		return id;
	}


	public void setId(BigInteger id) {
		this.id = id;
	}


	public int getFrom_() {
		return from_;
	}


	public void setFrom_(int from_) {
		this.from_ = from_;
	}


	public int getTo_() {
		return to_;
	}


	public void setTo_(int to_) {
		this.to_ = to_;
	}


	public int getCentralId() {
		return centralId;
	}


	public void setCentralId(int centralId) {
		this.centralId = centralId;
	}


	public int getInputNameId() {
		return inputNameId;
	}


	public void setInputNameId(int inputNameId) {
		this.inputNameId = inputNameId;
	}


	public int getFaultType() {
		return faultType;
	}


	public void setFaultType(int faultType) {
		this.faultType = faultType;
	}


	public LocalDate getOpen_date() {
		return open_date;
	}


	public void setOpen_date(LocalDate open_date) {
		this.open_date = open_date;
	}


	public LocalTime getOpen_time() {
		return open_time;
	}


	public void setOpen_time(LocalTime open_time) {
		this.open_time = open_time;
	}


	public LocalDate getClose_date() {
		return close_date;
	}


	public void setClose_date(LocalDate close_date) {
		this.close_date = close_date;
	}


	public LocalTime getClose_time() {
		return close_time;
	}


	public void setClose_time(LocalTime close_time) {
		this.close_time = close_time;
	}


	public String getComment() {
		return comment;
	}


	public void setComment(String comment) {
		this.comment = comment;
	}


	public String getResult() {
		return result;
	}


	public void setResult(String result) {
		this.result = result;
	}


	public boolean isActive() {
		return isActive;
	}


	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}


	public boolean isNew() {
		return isNew;
	}


	public void setNew(boolean isNew) {
		this.isNew = isNew;
	}


	public Faults(int inputNameId, int faultType, String comment) {
		super();
		this.inputNameId = inputNameId;
		this.faultType = faultType;
		this.comment = comment;
	}
	
}
