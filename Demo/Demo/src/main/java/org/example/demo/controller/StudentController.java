package org.example.demo.controller;

import org.example.demo.model.MajorCountVO;
import org.example.demo.model.ScoreCountVO;
import org.example.demo.model.Student;
import org.example.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @GetMapping
    public List<Student> getAllStudents() {
        return studentService.getAllStudent();
    }

    @GetMapping("/search")
    public List<Student> getStudentsByName(@RequestParam String name) {
        return studentService.getStudentByName(name);
    }

    @PostMapping
    public void addStudent(@RequestBody Student student) {
        studentService.addStudent(student);
    }

    @DeleteMapping("/{id}")
    public void deleteStudent(@PathVariable Long id) {
        studentService.deleteStudent(id);
    }

    @PutMapping("/{id}")
    public void updateStudent(@PathVariable("id") Long id,
                              @RequestBody Student student) {
        if (student.getId().equals(id)) {
            studentService.updateStudent(student);
        }
    }

    @GetMapping("/selectCoachCourseCount")
    public List<MajorCountVO> selectCoachCourseCount() {
        return studentService.getMajorStudentCount();
    }

    @GetMapping("/selectScoreCount")
    public List<ScoreCountVO> selectScoreCount() {
        return studentService.getScoreCounts();
    }
}