package org.example.demo.service;

import org.example.demo.mapper.StudentMapper;
import org.example.demo.model.MajorCountVO;
import org.example.demo.model.ScoreCountVO;
import org.example.demo.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class StudentService {

    @Autowired
    private StudentMapper studentMapper;

    public List<Student> getAllStudent() {
        return studentMapper.findAll();
    }

    public Optional<Student> getStudentById(Long id) {
        return studentMapper.findById(id);
    }

    public void addStudent(Student student) {
        studentMapper.insert(student);
    }

    public void updateStudent(Student student) {
        studentMapper.updatestu(student);
    }

    public void deleteStudent(Long id) {
        studentMapper.delstu(id);
    }

    public List<Student> getStudentByName(String name) {
        return studentMapper.findByName(name);
    }

    public List<MajorCountVO> getMajorStudentCount() {
        return studentMapper.getMajorStudentCount();
    }

    public List<ScoreCountVO> getScoreCounts() {
        return studentMapper.getScoreStudentCount();
    }
}