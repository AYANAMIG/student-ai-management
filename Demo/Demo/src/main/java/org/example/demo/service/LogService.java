package org.example.demo.service;

import org.example.demo.mapper.LogMapper;
import org.example.demo.model.Log;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogService {

    @Autowired
    private LogMapper logMapper;

    public List<Log> getAllLogs() {
        return logMapper.findAll();
    }

    public void addLog(Log log) {
        logMapper.insert(log);
    }
}