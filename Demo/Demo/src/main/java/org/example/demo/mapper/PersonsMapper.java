package org.example.demo.mapper;

import org.example.demo.model.persons;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PersonsMapper {
    persons findpersonByUserName(@Param("uname") String uname,
                                 @Param("upwd") String upwd);
}