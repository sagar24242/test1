package com.controller;



import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.SubjectBean;
import com.dao.ClassDao;
import com.dao.SubjectDao;


@Controller
public class SubjectController {
	@Autowired
	SubjectDao subjectdao;
	@Autowired
	ClassDao classdao;
	@Autowired
	Date date;
	
	@SuppressWarnings("deprecation")
	@GetMapping("/subject")
	public String newSubject(Model model) {
		
		model.addAttribute("subject", subjectdao.getAllSubject());
	
	 model.addAttribute("dy",date.toLocaleString());
	
		return "NewSubject";
	}
	
	@PostMapping("/newsubject")
	public String newSubject(SubjectBean subject,Model model) {
		boolean p=false;
	   SubjectBean dbSubject=subjectdao.getSubjectByName(subject.getSubjectName());
		if(dbSubject!=null) {
		if((subject.getSubjectName()).equalsIgnoreCase(dbSubject.getSubjectName())==true){
			p=true;
		
		}
		}
		
		if(p==true) {
			model.addAttribute("error","This Class Name Already Exists!");
			
		}else {
			
			subjectdao.insertSubject(subject);
		}
	return "redirect:/subject";
	}
	@GetMapping("/deletesubject/{subjectId}")
	public String deleteSubject(@PathVariable("subjectId") int subjectId) {

		subjectdao.deleteSubject(subjectId);

		return "redirect:/subject";
	}
	@GetMapping("/editsubject")
	public String editSubject(@RequestParam("subjectId") int subjectId, Model model) {	
		
	
		model.addAttribute("sub", subjectdao.getSubjectById(subjectId));
		
		return "redirect:/subject";

	}

	@PostMapping("/updatesubject")
	public String updateSubjectById(SubjectBean subject) {
		subjectdao.updateSubject(subject);
		return "redirect:/subject";
	}
	
	
	
}