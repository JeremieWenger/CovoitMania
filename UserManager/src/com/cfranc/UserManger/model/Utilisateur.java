package com.cfranc.UserManger.model;

import java.io.Serializable;

public class Utilisateur implements Serializable {

	private static final long serialVersionUID = 42L;

	private String firstname;
	private String lastname;
	private int age;
	private String email;
	private long id;
	private String password;
	private String address;
	private String city;
	private long Score;
	private int PostCode;
	public int getPostCode() {
		return PostCode;
	}
	public void setPostCode(int postalCode) {
		PostCode = postalCode;
	}

	private double[] coord;
	
	public double[] getCoord() {
		return coord;
	}
	public void setCoord(double[] coord) {
		this.coord = coord;
	}
	public long getScore() {
		return Score;
	}
	public void setScore(long score) {
		Score = score;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPassword(){
		return this.password;
	}
	public void setPassword(String newPassword){
		this.password=newPassword;
	}
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString(){
		return this.getFirstname() + " " + this.getLastname() + " " + this.getAge() + " " + this.getEmail();
	}
}
