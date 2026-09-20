package org.example.demo.mapper;

import org.example.demo.model.Log;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface LogMapper {
    List<Log> findAll();
    void insert(Log log);
}