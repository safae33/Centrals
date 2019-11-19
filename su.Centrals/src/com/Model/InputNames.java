package com.Model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="InputNames")
public class InputNames implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "inputNames_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "inputNames_id_seq", sequenceName = "inputNames_id_seq", initialValue = 1, allocationSize = 1)
	private int id;
	private String inputName;
	private int centralId;
	private int a_t;
	private int g_t;
	private int xwh;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getInputName() {
		return inputName;
	}
	public void setInputName(String inputName) {
		this.inputName = inputName;
	}
	public int getCentralId() {
		return centralId;
	}
	public void setCentralId(int centralId) {
		this.centralId = centralId;
	}
	public int getA_t() {
		return a_t;
	}
	public void setA_t(int a_t) {
		this.a_t = a_t;
	}
	public int getG_t() {
		return g_t;
	}
	public void setG_t(int g_t) {
		this.g_t = g_t;
	}
	public int getXwh() {
		return xwh;
	}
	public void setXwh(int xwh) {
		this.xwh = xwh;
	}
	
}
