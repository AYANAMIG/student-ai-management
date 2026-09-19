package org.example.demo.mapper;

import org.example.demo.model.MajorCountVO;
import org.example.demo.model.ScoreCountVO;
import org.example.demo.model.Student;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Optional;

@Mapper
public interface StudentMapper {
    List<Student> findAll();
    Optional<Student> findById(Long id);
    void insert(Student student);
    List<Student> findByName(String name);
    void delstu(Long id);
    void updatestu(Student student);
    List<MajorCountVO> getMajorStudentCount();
    List<ScoreCountVO> getScoreStudentCount();
}