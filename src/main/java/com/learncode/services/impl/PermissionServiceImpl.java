package com.learncode.services.impl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.learncode.Respositories.PermissionRepository;
import com.learncode.models.Permission;
import com.learncode.services.PermissionService;

@Service
public class PermissionServiceImpl implements PermissionService{
	@Autowired
	PermissionRepository perRepo;

	@Override
	public <S extends Permission> S save(S entity) {
		return perRepo.save(entity);
	}

	@Override
	public Optional<Permission> findById(String id) {
		return perRepo.findById(id);
	}

	@Override
	public boolean existsById(String id) {
		return perRepo.existsById(id);
	}

	@Override
	public Iterable<Permission> findAll() {
		return perRepo.findAll();
	}

	@Override
	public Iterable<Permission> findAllById(Iterable<String> ids) {
		return perRepo.findAllById(ids);
	}

	@Override
	public long count() {
		return perRepo.count();
	}

	@Override
	public void deleteById(String id) {
		perRepo.deleteById(id);
	}

	@Override
	public void delete(Permission entity) {
		perRepo.delete(entity);
	}
	
	
}
