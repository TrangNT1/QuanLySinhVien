package com.learncode.Respositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.learncode.models.Permission;
import com.learncode.models.User;

@Repository
public interface UserRespositories extends CrudRepository<User,String> {
	User findByUsername(String username);
	
	@Query(value="select u.permissions from User u where u.username = :username")
	public List<Permission> getAllPermission(@Param("username") String username);
}
