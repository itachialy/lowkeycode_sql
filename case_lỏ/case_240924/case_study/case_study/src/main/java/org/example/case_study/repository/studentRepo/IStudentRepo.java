package org.example.case_study.repository.studentRepo;

import org.example.case_study.model.Account;
import org.example.case_study.model.Class;
import org.example.case_study.model.Student;

import java.sql.SQLException;
import java.util.List;

public interface IStudentRepo {
    List<Student> findAll();

    List<Class> findAllClass();

    void addNewStudent(Student student);

    void deleteStudent(int id);

    Student getStudentById(int id);

    void save(Student student);

    boolean checkEmail(String email) throws SQLException;

    boolean checkEmailForUpdate(int id, String email) throws SQLException;

    List<Student> searchByName(String name);

    Account checkLogin(String user, String pass);

    List<Student> filterStudent(String name, String className);
}