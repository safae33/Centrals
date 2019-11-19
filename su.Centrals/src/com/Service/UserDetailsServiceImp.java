package com.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.Dao.UserDao;
import com.Model.TypeAndPw;

@Service("userDetailsService")
public class UserDetailsServiceImp implements UserDetailsService{

	@Autowired
	private UserDao userDao;
	
	private String toRole(int type) {
		String rol = "";
		if(type == 1) rol = "USER";
		if(type == 2) rol = "OWNER";
		if(type == 3) rol = "ADMIN";
		if(type == 4) rol = "TECH";
		return rol;
	}
	@Transactional
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		TypeAndPw user = userDao.GetUserByUserName(username);

	    UserBuilder builder = null;
	    if (user != null) {
	      builder = org.springframework.security.core.userdetails.User.withUsername(username);
	      builder.password(new BCryptPasswordEncoder().encode((CharSequence) user.pw));
	      builder.authorities(toRole((int) user.type));
	    } else {
	      throw new UsernameNotFoundException("User not found.");
	    }

	    return builder.build();
	}
}
