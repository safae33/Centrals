package com.Model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="faultResult")
public class FaultResult implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "faultResult_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "faultResult_id_seq", sequenceName = "faultResult_id_seq", initialValue = 1, allocationSize = 1)
	private long id;
	private long faultId;
	private String situatedFaults;
	private String fixingWays;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
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
	public FaultResult() {
		super();
		// TODO Auto-generated constructor stub
	}
	public long getFaultId() {
		return faultId;
	}
	public void setFaultId(long faultId) {
		this.faultId = faultId;
	}

	
}
