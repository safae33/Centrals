package com.Model;

import java.io.Serializable;
import java.math.BigInteger;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.persistence.*;

@Entity
@Table(name="Inputs")
public class Input implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "inputs_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "inputs_id_seq", sequenceName = "inputs_id_seq", initialValue = 1, allocationSize = 1)
	private BigInteger id;
	private LocalDate date_;
	private LocalTime time_;
	private int InputNameId;
	private int userId;
	private int centralId;
	private long datum;
	private int a_t;
	private int g_t;
	private int xwh;
	private float dollarCurrency;

	public BigInteger getId() {
		return id;
	}

	public void setId(BigInteger id) {
		this.id = id;
	}

	public LocalDate getDate_() {
		return date_;
	}

	public void setDate_(LocalDate date_) {
		this.date_ = date_;
	}

	public LocalTime getTime_() {
		return time_;
	}

	public void setTime_(LocalTime time_) {
		this.time_ = time_;
	}

	public int getInputNameId() {
		return InputNameId;
	}

	public void setInputNameId(int inputNameId) {
		InputNameId = inputNameId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getCentralId() {
		return centralId;
	}

	public void setCentralId(int centralId) {
		this.centralId = centralId;
	}

	public long getDatum() {
		return datum;
	}

	public void setDatum(long datum) {
		this.datum = datum;
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

	public Input() {	
	}

	public float getDollarCurrency() {
		return dollarCurrency;
	}

	public void setDollarCurrency(float dollarCurrency) {
		this.dollarCurrency = dollarCurrency;
	}

	
	
}
