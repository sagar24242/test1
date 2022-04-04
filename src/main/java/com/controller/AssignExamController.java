package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.bean.ExamBean;
import com.dao.AssignSubjectDao;
import com.dao.ExamDao;

@Controller

public class AssignExamController {
	@Autowired
	ExamDao examdao;
	@Autowired
	
	AssignSubjectDao assignsubjectdao;
	@GetMapping("/examsubject")
	public String assignExamSubject(ExamBean exam,Model model) {
		
		model.addAttribute("exam", examdao.getAllExam());

	return "AssignExamSubject";

}
	@GetMapping("/examsubject/{examId}")
	public String assignExamSubject(@PathVariable int examId,Model model) {
	     
			model.addAttribute("subject",examdao.getAllSubject(examId));
	
	return "redirect:/examsubject";
}
}

	
