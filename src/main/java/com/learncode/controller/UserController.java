package com.learncode.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.learncode.CheckPermission;
import com.learncode.ColorAlert;
import com.learncode.CustomUserDetail;
import com.learncode.Utils;
import com.learncode.models.Permission;
import com.learncode.models.User;
import com.learncode.services.PermissionService;
import com.learncode.services.UserServices;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserServices userServices;

	@Autowired
	PermissionService permissionService;

	public String validateForAdd(User user) {
		if (user.getUsername().equals("") || user.getUsername() == null) {
			return "You have not entered a username";
		}
		if (user.getPassword().isEmpty() || user.getPassword() == null) {
			return "You have not entered a password";
		}
		if (user.getPassword().length() < 6) {
			return "Password must contain at least 6 characters";
		}
		return null;
	}

	@PreAuthorize("hasPermission('', 'LIST_USER')")
	@RequestMapping("/list")
	public String list(ModelMap model, HttpSession session) {
		model.addAttribute("LIST_USER", userServices.findAll());
		return "view-user";
	}

	@GetMapping("/")
	public String addOrEdit(ModelMap model, HttpSession session) {
		User user = new User();
		model.addAttribute("USER", user);
		model.addAttribute("ACTION", "/user/saveOrUpdate");
		session.setAttribute("MESSUB", "");
		session.setAttribute("MESUSERNAME", "");
		session.setAttribute("MESPASSWORD", "");
		return "adduser";
	}

	@PostMapping("/saveOrUpdate")
	public String saveOrUpdate(@ModelAttribute("USER") User user, HttpSession session, RedirectAttributes redirect) {
		final String redirectUrl = "redirect:/user/edit/" + user.getUsername();
		final String messageErr = this.validateForAdd(user);
		if(null == messageErr) {
			userServices.save(user);
			Utils.setMessageAlert(ColorAlert.success, "Cập nhật thành công", redirect);
		}else {
			Utils.setMessageAlertError(messageErr, redirect);
		}
		return redirectUrl; 
	}

	@RequestMapping("/edit/{id}")
	public String edit(ModelMap model, @PathVariable(name = "id") String id, HttpSession session) {
//		
		Optional<User> u = userServices.findById(id);
		if (u.isPresent()) {
			model.addAttribute("USER", u.get());
		} else {
			model.addAttribute("USER", new User());
		}

		CustomUserDetail user = new CustomUserDetail(u.get());
		if (user.isSuperAdmin()) {
			return "redirect:/user/list";
		}

		model.addAttribute("ACTION", "/user/saveOrUpdate");
		model.addAttribute("CHUCNANG", permissionService.findAll());
		model.addAttribute("CHUCNANG_USER",
				new CheckPermission(userServices.getAllPermission(user.getUsername()), false));
		session.setAttribute("MESSUB", "");
		session.setAttribute("MESUSERNAME", "");
		session.setAttribute("MESPASSWORD", "");
		return "adduser";
	}

	@RequestMapping("/delete/{id}")
	public String delete(ModelMap model, @PathVariable(name = "id") String id) {
		userServices.deleteById(id);
		model.addAttribute("LIST_USER", userServices.findAll());
		return "redirect:/user/list";
	}

}
