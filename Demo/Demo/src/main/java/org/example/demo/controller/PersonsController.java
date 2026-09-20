package org.example.demo.controller;

import org.example.demo.model.Log;
import org.example.demo.model.persons;
import org.example.demo.service.LogService;
import org.example.demo.service.PersonsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/persons")
public class PersonsController {

    @Autowired
    private PersonsService personsService;

    @Autowired
    private LogService logService;

    @PostMapping("/login")
    public String login(@RequestBody persons person) {
        persons loginUser = personsService.login(person.getUname(), person.getUpwd());
        if (loginUser != null) {
            // 记录登录日志
            Log log = new Log();
            log.setOperator(person.getUname());
            log.setType("登录系统");
            logService.addLog(log);
            return "登录成功";
        } else {
            return "用户名或密码错误!";
        }
    }
}