package com.learncode;

public enum ColorAlert {
	primary("primary"), secondary("secondary"), success("success"), danger("danger"), warning("warning"), info("info"),
	light("light"), dark("dark");

	private String color;

	private ColorAlert(String color) {
		this.color = color;
	}
	
	public String getColor() {
		return this.color;
	}
}
