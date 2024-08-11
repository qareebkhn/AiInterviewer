package com.hasib.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class interviewResult {

	@Id
	private int intId;
	private String role;
	private String interviewType;
	private String result;
	private String score;
	private String comment;

	public interviewResult() {

	}

	public interviewResult(int intId, String role, String interviewType, String result, String score, String comment) {
		super();
		this.intId = intId;
		this.role = role;
		this.interviewType = interviewType;
		this.result = result;
		this.score = score;
		this.comment = comment;
	}

	public int getIntId() {
		return intId;
	}

	public void setIntId(int intId) {
		this.intId = intId;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getInterviewType() {
		return interviewType;
	}

	public void setInterviewType(String interviewType) {
		this.interviewType = interviewType;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	@Override
	public String toString() {
		return "interviewResult [intId=" + intId + ", role=" + role + ", interviewType=" + interviewType + ", result="
				+ result + ", score=" + score + ", comment=" + comment + "]";
	}

}
