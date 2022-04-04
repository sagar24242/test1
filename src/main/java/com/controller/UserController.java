package com.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.bean.RoleBean;
import com.bean.UserBean;
import com.dao.RoleDao;
import com.dao.UserDao;

@Controller
public class UserController {

	@Autowired
	RoleDao roleDao;
	@Autowired
	UserDao userDao;
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	 @Autowired
	   Date date;

	@GetMapping("/newuser")
	public String newUser(Model model) {

		List<RoleBean> roles = roleDao.getAllRoles();
		model.addAttribute("roles", roles);
		return "NewUser";
	}
	@GetMapping("/users")
	public String createUser(Model model) {
		List<RoleBean> role = roleDao.getAllRoles();
		model.addAttribute("role", role);
		model.addAttribute("users", userDao.getAllUsers());
		 model.addAttribute("dy",date.toLocaleString());
		return "User";
	}
	@PostMapping("/listuser")
	public String listUser(UserBean user,Model model) {
		boolean p=false;
		UserBean dbUser=userDao.getUserByEmail(user.getEmail());
		if(dbUser!=null) {
		if((user.getEmail()).equalsIgnoreCase(dbUser.getEmail())==true){
			p=true;
		}
		}
		
		if(p==true) {
			model.addAttribute("error","Account with this Email Address already exists!");
			
		}else {
		String plainPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(plainPassword);
		user.setPassword(encPassword);
		userDao.addUser(user);
		
		}
		return "redirect:/users";
	}


	@PostMapping("/saveuser")
	public String saveUser(UserBean user,Model model) {
		boolean p=false;
		UserBean dbUser=userDao.getUserByEmail(user.getEmail());
		if(dbUser!=null) {
		if((user.getEmail()).equalsIgnoreCase(dbUser.getEmail())==true){
			p=true;
		}
		}
		
		if(p==true) {
			model.addAttribute("error","Account with this Email Address already exists!");
			return "NewUser";
		}else {
		String plainPassword = user.getPassword();
		String encPassword = bCryptPasswordEncoder.encode(plainPassword);
		user.setPassword(encPassword);
		userDao.addUser(user);
		return "redirect:/login";
		}
	}

	@GetMapping("/getallusers")
	public String getAllUsers(Model model) {
		List<UserBean> users = userDao.getAllUsers();
		model.addAttribute("users", users);
		return "ListUsers";
	}

	@GetMapping("/deleteuser/{userId}")
	public String deleteUser(@PathVariable("userId") int userId) {

		userDao.deleteUser(userId);

		return "redirect:/users";
	}

}