package org.example.demo.controller;

import org.example.demo.model.Log;
import org.example.demo.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/logs")
public class LogController {

    @Autowired
    private LogService logService;

    @GetMapping
    public List<Log> getAllLogs() {
        return logService.getAllLogs();
    }

    @PostMapping
    public void addLog(@RequestBody Log log) {
        logService.addLog(log);
    }
}