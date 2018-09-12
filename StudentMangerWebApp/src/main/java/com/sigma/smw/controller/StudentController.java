package com.sigma.smw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sigma.smw.entity.Student;
import com.sigma.smw.service.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	

	@GetMapping("/")
	public String listStudents(Model theModel) {
		
		List<Student> theStudents = studentService.getStudent();
		
		theModel.addAttribute("students",theStudents);
		
		return "list-students";
	}
	
	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model theModel) {
		
		//create a model attribute to bind form data
		Student theStudent = new Student();
		
		theModel.addAttribute("student",theStudent);
		
		return "student-form";
	}
	
	@PostMapping("/saveStudent")
	public String saveCustomer(@ModelAttribute("student") Student theStudent) {
		
		// save the customer using our service
		
		studentService.saveStudent(theStudent);
		
		return "redirect:/";
	}
	
	@GetMapping("/showFormForUpdate")
	public String showForm(@RequestParam("studentId") int theId, Model theModel) {
	
		//get the student using service
		Student theStudent = studentService.getStudent(theId);
		
		// set student as a model attribute to pre -populate the form
		theModel.addAttribute("student",theStudent);
		
		// send over to the form
		return "student-form";
	}
	
	@GetMapping("/delete")
	public String deleteStudent(@RequestParam("studentId") int theId) {
		
		studentService.deleteStudent(theId);
		return "redirect:/";
	}
	
}
