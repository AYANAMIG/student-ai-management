package org.example.demo.service;

import org.example.demo.mapper.PersonsMapper;
import org.example.demo.model.persons;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonsService {

    @Autowired
    private PersonsMapper personsMapper;

    public persons login(String uname, String upwd) {
        return personsMapper.findpersonByUserName(uname, upwd);
    }
}