package com.learncode.services.impl;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import com.learncode.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.learncode.CheckPermission;
import com.learncode.CustomUserDetail;
import com.learncode.Utils;
import com.learncode.Respositories.UserRespositories;
import com.learncode.models.Permission;
import com.learncode.models.User;

@Service
public class UserServicesImpl implements UserServices {
	@Autowired
	UserRespositories userRespositories;

	@Autowired
	HttpSession session;

	@Override
	public User save(User entity) {
		if (entity.getUsername().equals("admin")) {
			final CustomUserDetail u = Utils.getUser();
			if (!u.getUsername().equals("admin"))
				return null;
		}
		return userRespositories.save(entity);
	}

	@Override
	public List<Permission> getAllPermission(String username) {
		return userRespositories.getAllPermission(username);
	}

	@Override
	public List<User> saveAll(List<User> entities) {
		// Fix
		return (List<User>) userRespositories.saveAll(entities);
	}

	@Override
	public Optional<User> findById(String id) {
		return userRespositories.findById(id);
	}

	@Override
	public boolean existsById(String id) {
		return userRespositories.existsById(id);
	}

	@Override
	public Iterable<User> findAll() {
		return userRespositories.findAll();
	}

	@Override
	public List<User> findAllById(List<String> ids) {
		return (List<User>) userRespositories.findAllById(ids);
	}

	@Override
	public long count() {
		return userRespositories.count();
	}

	@Override
	public void deleteById(String id) {
		if (id.equals("admin"))
			return;
		userRespositories.deleteById(id);
	}

	@Override
	public void delete(User entity) {
		userRespositories.delete(entity);
	}

	@Override
	public void deleteAll(List<User> entities) {
		for (User u : entities) {
			if (u.getUsername().equals("admin"))
				return;
			entities.remove(u);
		}
		userRespositories.deleteAll(entities);
	}

	@Override
	public User findByUsername(String username) {
		return userRespositories.findByUsername(username);
	}

	@Override
	public boolean checkLogin(String username, String password) {
		// TODO Auto-generated method stub
		Optional<User> optionalUser = findById(username);
		if (optionalUser.isPresent() && optionalUser.get().getPassword().equals(password)) {
			return true;
		}
		return false;
	}

	@Override
	public boolean checkExits(User user) {

		User u = findByUsername(user.getUsername());
		if (u == null) {
			return false;
		} else {
			if (u.getUsername() == user.getUsername()) {
				return false;
			}
		}
		return true;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Optional<User> user = findById(username);
		if (!user.isPresent())
			throw new UsernameNotFoundException("");
		return new CustomUserDetail(user.get());
	}
}
