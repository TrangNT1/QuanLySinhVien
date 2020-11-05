package com.learncode;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;

import com.learncode.models.Permission;
import com.learncode.services.UserServices;

public class CustomPermissionEvaluator implements PermissionEvaluator {

	@Autowired
	UserServices userService;
	
	@Autowired
	HttpSession session;

	@Override
	public boolean hasPermission(Authentication authentication, Object targetDomainObject, Object permission) {
		if (null == authentication)
			return false;

		CustomUserDetail user = (CustomUserDetail) authentication.getPrincipal();

		if (null == user)
			return false;

		if (user.isSuperAdmin())
			return true;

		List<Permission> pers = userService.getAllPermission(user.getUsername());
		for (Permission p : pers) {
			if (p.getId().equals(permission))
				return true;
		}

		session.setAttribute("permissions", new CheckPermission(pers, false));  
		return false;
	}

	@Override
	public boolean hasPermission(Authentication authentication, Serializable targetId, String targetType,
			Object permission) {
		throw new UnsupportedOperationException();
	}

}
