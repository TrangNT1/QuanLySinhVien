package com.learncode.Respositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.learncode.models.Permission;

@Repository
public interface PermissionRepository extends CrudRepository<Permission, String>{
	
}
