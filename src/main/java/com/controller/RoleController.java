package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.RoleBean;
import com.dao.RoleDao;

@Controller
public class RoleController {
	@Autowired
	RoleDao roleDao;

//	@RequestMapping(value ="newrole",method = RequestMethod.GET)
	@GetMapping("/newrole")
	public String newRole() {
		return "NewRole";
	}

	@PostMapping("/saverole")
	public String saveRole(RoleBean role) {
		roleDao.insertRole(role);
		return "redirect:/listroles";
	}

	@GetMapping("/listroles")
	public String listRoles(Model model) {
		List<RoleBean> roles = roleDao.getAllRoles();
		model.addAttribute("roles", roles);
		return "ListRoles";
	}

	@GetMapping("/deleterole/{roleId}")
	public String deleteRole(@PathVariable("roleId") int roleId) {

		roleDao.deleteRole(roleId);

		return "redirect:/listroles";
	}

	@GetMapping("/editrole")
	public String editRole(@RequestParam("roleId") int roleId, Model model) {

		RoleBean role = roleDao.getRoleById(roleId);
		model.addAttribute("role", role);
		return "EditRole";

	}

	@PostMapping("/updaterole")
	public String updateRole(RoleBean role) {
		roleDao.updateRole(role);
		return "redirect:/listroles";
	}
}