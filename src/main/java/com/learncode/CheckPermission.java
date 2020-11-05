package com.learncode;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.learncode.models.Permission;

public class CheckPermission {
	private Map<String, Boolean> perMap = new HashMap<>();
	private boolean userIsSuperAdmin;

	public CheckPermission(List<Permission> pers, boolean userIsSuperAdmin) {
		this.userIsSuperAdmin = userIsSuperAdmin;
		if (!userIsSuperAdmin) {
			for (Permission per : pers) {
				perMap.put(per.getId(), true);
			}
		}
	}

	public boolean checkPermission(String per) {
		if (this.userIsSuperAdmin)
			return true;
		return Boolean.TRUE.equals(this.perMap.get(per));
	}
}
