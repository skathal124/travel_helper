package com.travel.plan.member.model;
//com.travel.plan.member.model.TravelMember
import java.io.Serializable;

public class TravelMember implements Serializable {

	private String id;
	private String pwd;
	private String name;
	private String nickname;
	private String email;
	private int auth;
	
	public TravelMember() {
		super();
	}

	public TravelMember(String id, String pwd, String name, String nickname, String email, int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.auth = auth;
	}

	public TravelMember(String id, String pwd, String name, String nickname, String email) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "TravelMember [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", email="
				+ email + ", auth=" + auth + "]";
	}
	
	
}

