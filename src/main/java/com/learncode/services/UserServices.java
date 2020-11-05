package com.learncode.services;

import java.util.List;
import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

import com.learncode.models.Permission;
import com.learncode.models.User;

@Service
public interface UserServices extends UserDetailsService{

	boolean checkExits(User user);

	boolean checkLogin(String username, String password);

	User findByUsername(String username);

	void deleteAll(List<User> entities);

	void delete(User entity);

	void deleteById(String id);

	long count();

	List<User> findAllById(List<String> ids);

	Iterable<User> findAll();

	boolean existsById(String id);

	Optional<User> findById(String id);

	List<User> saveAll(List<User> entities);

	User save(User entity);

	List<Permission> getAllPermission(String username);

}
