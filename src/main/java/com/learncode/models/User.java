package com.learncode.models;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity	
@Table(name = "qtht_users")
public class User implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "username", length = 50)
	private String username;
	@Column(name = "password", length = 50)
	private String password;

	@Column(name = "fullname", length = 50)
	private String fullname;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name="qtht_chucnang_user", joinColumns = @JoinColumn(name="user_id"), inverseJoinColumns = @JoinColumn(name = "chucnang_id"))
	private List<Permission> permissions;

	public User() {
		super();
	}

	public User(String username, String password, String fullname) {
		super();

		this.username = username;
		this.password = password;
		this.fullname = fullname;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public List<Permission> getPermissions() {
		return permissions;
	}
	
	public void setPermissions(List<Permission> permissions) {
		this.permissions = permissions;
	}
	
	
}
