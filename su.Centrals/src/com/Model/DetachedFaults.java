package com.Model;

import java.io.Serializable;
import java.math.BigInteger;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CascadeType;

@Entity
@Table(name="detachedfaults")
public class DetachedFaults implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "detachedfaults_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "detachedfaults_id_seq", sequenceName = "detachedfaults_id_seq", initialValue = 1, allocationSize = 1)
	private BigInteger id;
	private BigInteger toAdmin;
	private BigInteger fromAdmin;
	public DetachedFaults(BigInteger toAdmin, BigInteger fromAdmin) {
		super();
		this.toAdmin = toAdmin;
		this.fromAdmin = fromAdmin;
	}
	public DetachedFaults() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BigInteger getId() {
		return id;
	}
	public void setId(BigInteger id) {
		this.id = id;
	}
	public BigInteger getToAdmin() {
		return toAdmin;
	}
	public void setToAdmin(BigInteger toAdmin) {
		this.toAdmin = toAdmin;
	}
	public BigInteger getFromAdmin() {
		return fromAdmin;
	}
	public void setFromAdmin(BigInteger fromAdmin) {
		this.fromAdmin = fromAdmin;
	}
	
}
