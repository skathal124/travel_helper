package com.travel.plan.member.help;

import java.io.Serializable;

public class YesMember implements Serializable {
	private String message;

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	//{"message":getMessage()}
}
