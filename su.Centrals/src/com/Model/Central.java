package com.Model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="Centrals")
public class Central implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "centrals_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "centrals_id_seq", sequenceName = "centrals_id_seq", initialValue = 1, allocationSize = 1)
	private int id;
	private String name_;
	private byte inputNum;
	private boolean isActive;
	
	public int getId() {
		return id;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName_() {
		return name_;
	}
	public void setName_(String name_) {
		this.name_ = name_;
	}
	public byte getInputNum() {
		return inputNum;
	}
	public void setInputNum(byte inputNum) {
		this.inputNum = inputNum;
	}
	public Central(String name_, byte inputNum, boolean isActive) {
		super();
		this.name_ = name_;
		this.inputNum = inputNum;
		this.isActive = isActive;
	}
	public Central() {}
	public boolean isActive() {
		return isActive;
	}

	
}
