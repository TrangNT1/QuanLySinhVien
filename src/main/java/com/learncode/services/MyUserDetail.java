//package com.learncode.services;
//
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.Collection;
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;

//import com.learncode.models.User;

//
//
//public class MyUserDetail implements UserDetails {
//
//
//	private User user;
//	
//	
//	public MyUserDetail(User user) {
//		this.user = user;
//	}
//
//	@Override
//	public Collection<? extends GrantedAuthority> getAuthorities() {
//        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
//        for (ChucNang1 privilege : nguoidung.getVaitro().get(0).getChucnang()) {
//            authorities.add(new SimpleGrantedAuthority(privilege.getMachucnang()));
//        }
//        return authorities;
//	}
//	
//	@Override
//	public String getPassword() {
//		return nguoidung.getPassword();
//	}
//
//	@Override
//	public String getUsername() {
//		return nguoidung.getTennguoidung();
//	}
//
//	@Override
//	public boolean isAccountNonExpired() {
//		return true;
//	}
//
//	@Override
//	public boolean isAccountNonLocked() {
//		return true;
//	}
//
//	@Override
//	public boolean isCredentialsNonExpired() {
//		return true;
//	}
//
//	@Override
//	public boolean isEnabled() {
//		return true;
//	}
//
//}
