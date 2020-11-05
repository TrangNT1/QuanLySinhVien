package com.learncode;

import java.util.Objects;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

public class Utils {

	public static CustomUserDetail getUser() {
		return (CustomUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	public static void setMessageAlert(ColorAlert color, String message, ModelMap model) {
		model.addAttribute("message", message);
		model.addAttribute("messageColor", color.getColor());
	}

	public static void setMessageAlert(ColorAlert color, String message, RedirectAttributes model) {
		model.addFlashAttribute("message", message);
		model.addFlashAttribute("messageColor", color.getColor()); 
	}

	public static void setMessageAlert(String message, ModelMap model) {
		setMessageAlert(ColorAlert.success, message, model);
	}

	public static void setMessageAlert(String message, RedirectAttributes model) {
		setMessageAlert(ColorAlert.success, message, model);
	}

	public static void setMessageAlertError(String message, ModelMap model) {
		setMessageAlert(ColorAlert.danger, message, model);
	}

	public static void setMessageAlertError(String message, RedirectAttributes model) {
		setMessageAlert(ColorAlert.danger, message, model);
	}

}
