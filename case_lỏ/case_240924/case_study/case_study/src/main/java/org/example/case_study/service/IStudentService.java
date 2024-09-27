package org.example.case_study.service;

import org.example.case_study.model.Account;
import org.example.case_study.model.Class;
import org.example.case_study.model.Student;

import java.sql.SQLException;
import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    List<Class> findAllClass();
    void addNewStudent(Student student);
    void deleteStudent(int id);
    Student getStudentById( int id);
    void save(Student student);
    List<Student> searchByName(String name);
    boolean checkEmail(String email) throws SQLException;
    boolean checkEmailForUpdate(int id, String email) throws SQLException;
    Account checkLogin(String user, String pass);
    List<Student> filterStudent(String name, String className);

}
