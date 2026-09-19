package org.example.demo.model;

import java.time.LocalDate;

public class Student {
    private Long id;
    private String name;
    private int age;
    private String major;
    private String classp;
    private LocalDate enrol;

    public Student() {}

    public Student(Long id, String name, int age, String major,
                   String classp, LocalDate enrol) {
        this.id = id;
        this.name = name;
        this.age = age;
        this.major = major;
        this.classp = classp;
        this.enrol = enrol;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getClassp() {
        return classp;
    }

    public void setClassp(String classp) {
        this.classp = classp;
    }

    public LocalDate getEnrol() {
        return enrol;
    }

    public void setEnrol(LocalDate enrol) {
        this.enrol = enrol;
    }
}