package com.learncode.services;

import java.util.Optional;

import com.learncode.models.Permission;

public interface PermissionService {

	void delete(Permission entity);

	void deleteById(String id);

	long count();

	Iterable<Permission> findAllById(Iterable<String> ids);

	Iterable<Permission> findAll();

	boolean existsById(String id);

	Optional<Permission> findById(String id);

	<S extends Permission> S save(S entity);

}
