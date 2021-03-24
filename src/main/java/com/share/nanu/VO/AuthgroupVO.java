package com.share.nanu.VO;


public class AuthgroupVO {
	private String authname;
	private String authrole;

	public AuthgroupVO() {
		super();
	}

	public AuthgroupVO(String authname, String authrole) {
		super();
		this.authname = authname;
		this.authrole = authrole;
	}

	public String getAuthname() {
		return authname;
	}

	public void setAuthname(String authname) {
		this.authname = authname;
	}

	public String getAuthrole() {
		return authrole;
	}

	public void setAuthrole(String authrole) {
		this.authrole = authrole;
	}

}
