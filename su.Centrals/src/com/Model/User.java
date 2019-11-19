package com.Model;

import java.io.Serializable;

import javax.persistence.*;

@Entity
@Table(name="Users")
public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	@Column(name = "id", unique = true, nullable = false)
    @GeneratedValue(generator = "users_id_seq", strategy = GenerationType.SEQUENCE)
    @SequenceGenerator(name = "users_id_seq", sequenceName = "users_id_seq", initialValue = 1, allocationSize = 1)
	private int id;
	private String uName;
	private String password_;
	private int central;
	private int userType;
	private boolean isActive;
	private String mail;
	
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public boolean isActive() {
		return isActive;
	}
	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getPassword_() {
		return password_;
	}
	public void setPassword_(String password_) {
		this.password_ = password_;
	}
	public int getCentral() {
		return central;
	}
	public void setCentral(int central) {
		this.central = central;
	}
	public int getUserType() {
		return userType;
	}
	public void setUserType(int userType) {
		this.userType = userType;
	}
	public User() {}
	public User(int id, String uName, String password_, int central, int userType) {
		super();
		this.id = id;
		this.uName = uName;
		this.password_ = password_;
		this.central = central;
		this.userType = userType;
	}

}
