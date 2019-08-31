package com.zensar.bean;

import java.util.ArrayList;
import java.util.List;

public class Question {
	private int QID;
	private String question;
	private List<String> options=new ArrayList<String>(5);
	private String answer;	
	
	public int getQID() {
		return QID;
	}
	public void setQID(int qID) {
		QID = qID;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public List<String> getOptions() {
		return options;
	}
	public void setOptions(List<String> options) {
		this.options = options;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "Question [QID=" + QID + ", question=" + question + ", options="
				+ options + ", answer=" + answer + "]";
	}
	public Question(int qID, String question, List<String> options,
			String answer) {
		QID = qID;
		this.question = question;
		this.options = options;
		this.answer = answer;
	}
	
	

}
