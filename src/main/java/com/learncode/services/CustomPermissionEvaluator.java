package com.learncode.services;

import java.io.Serializable;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.PermissionEvaluator;
import org.springframework.security.core.Authentication;

public class CustomPermissionEvaluator implements PermissionEvaluator {

	@Autowired
	UserServices userServices;
	
	@PersistenceContext
	EntityManager em;
	
	private final String nativeQueryFindPermission = "";
	
	@Override
	public boolean hasPermission(Authentication auth, Object targetDomainObject, Object permission) {
//		System.out.println("per: "+permission + " -> " + auth.getName());
		if ((auth != null) && (permission instanceof String)) {
			List<Object[]> resultList = (List<Object[]>) this.em.createNativeQuery(this.nativeQueryFindPermission).setParameter(1, auth.getName()).getResultList();
			List<Object[]> data = resultList;
			for(Object[] per: data) {
				if(per[0].toString().equals(String.valueOf(permission))) {
					return true;
				}
			}
		}
		return false;
	}


	@Override
	public boolean hasPermission(Authentication auth, Serializable targetId, String targetType, Object permission) {
		System.out.println("per: "+permission);
		return false;
	}


}
