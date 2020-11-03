//package com.learncode.services;
//
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//
//import org.springframework.stereotype.Service;
//
//
//import com.learncode.models.Nguoidung;
//
//
//@Service
//public class UserDetailServiceImpl implements UserDetailsService {
//
//	@Autowired
//	UserServices userServices;
//	
//
////	@Override
////	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
////
//////		Nguoidung nd = this.nguoiDungService.findByTen(tennguoidung);
//////		if (nd == null) {
//////			throw new UsernameNotFoundException("Could not find nguoi dung");
//////		};
//////		
//////		return new MyUserDetail(nd);
////	}
//}
