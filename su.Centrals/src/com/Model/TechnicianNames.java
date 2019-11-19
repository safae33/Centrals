package com.Model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name="TechnicianNames")
public class TechnicianNames implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "techniciannames_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "techniciannames_id_seq", sequenceName = "techniciannames_id_seq", initialValue = 1, allocationSize = 1)
	private int id;
	private int userId;
	private String name_;
	public TechnicianNames(String name_, String surname_) {
		super();
		this.name_ = name_;
		this.surname_ = surname_;
	}
	private String surname_;
	public TechnicianNames() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getNameAndSurname() {
		return name_ + surname_;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getName_() {
		return name_;
	}
	public void setName_(String name_) {
		this.name_ = name_;
	}
	public String getSurname_() {
		return surname_;
	}
	public void setSurname_(String surname_) {
		this.surname_ = surname_;
	}

}
