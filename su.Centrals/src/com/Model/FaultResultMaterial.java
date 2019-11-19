package com.Model;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.*;

@Entity
@Table(name="faultResultMaterial")
public class FaultResultMaterial implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "faultResultMaterial_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "faultResultMaterial_id_seq", sequenceName = "faultResultMaterial_id_seq", initialValue = 1, allocationSize = 1)
	private long id;
	private BigInteger faultId;
	private String materialName;
	private String materialQuantity;
	private String materialExplanation;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public BigInteger getFaultId() {
		return faultId;
	}
	public void setFaultId(BigInteger faultId2) {
		this.faultId = faultId2;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	public String getMaterialQuantity() {
		return materialQuantity;
	}
	public void setMaterialQuantity(String materialQuantity) {
		this.materialQuantity = materialQuantity;
	}
	public String getMaterialExplanation() {
		return materialExplanation;
	}
	public void setMaterialExplanation(String materialExplanation) {
		this.materialExplanation = materialExplanation;
	}
	public FaultResultMaterial() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FaultResultMaterial(BigInteger faultId, String materialName, String materialQuantity, String materialExplanation) {
		super();
		this.faultId = faultId;
		this.materialName = materialName;
		this.materialQuantity = materialQuantity;
		this.materialExplanation = materialExplanation;
	}
	
	
}
