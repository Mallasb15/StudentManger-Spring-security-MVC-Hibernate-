package com.sigma.smw.service;

import java.util.List;

import com.sigma.smw.entity.Student;

public interface StudentService {
	
	public List<Student> getStudent();

	public void saveStudent(Student theStudent);

	public Student getStudent(int theId);

	public void deleteStudent(int theId);

}
