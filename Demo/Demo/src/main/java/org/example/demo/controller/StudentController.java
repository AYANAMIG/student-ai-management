package org.example.demo.controller;

import org.example.demo.model.Log;
import org.example.demo.model.MajorCountVO;
import org.example.demo.model.ScoreCountVO;
import org.example.demo.model.Student;
import org.example.demo.service.LogService;
import org.example.demo.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/students")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private LogService logService;

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
        // 记录添加日志
        Log log = new Log();
        log.setOperator("admin");
        log.setType("添加学生：" + student.getName());
        logService.addLog(log);
    }

    @DeleteMapping("/{id}")
    public void deleteStudent(@PathVariable Long id) {
        studentService.deleteStudent(id);
        Log log = new Log();
        log.setOperator("admin");
        log.setType("删除学生 ID：" + id);
        logService.addLog(log);
    }

    @PutMapping("/{id}")
    public void updateStudent(@PathVariable("id") Long id,
                              @RequestBody Student student) {
        if (student.getId().equals(id)) {
            studentService.updateStudent(student);
            Log log = new Log();
            log.setOperator("admin");
            log.setType("修改学生：" + student.getName());
            logService.addLog(log);
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