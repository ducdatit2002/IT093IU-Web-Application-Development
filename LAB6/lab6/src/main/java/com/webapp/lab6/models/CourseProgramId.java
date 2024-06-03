package com.webapp.lab6.models;

import java.io.Serializable;
import java.util.Objects;

public class CourseProgramId implements Serializable {
    private String courseId;
    private int programId;

    // Default constructor
    public CourseProgramId() {}

    // Parameterized constructor
    public CourseProgramId(String courseId, int programId) {
        this.courseId = courseId;
        this.programId = programId;
    }

    // Getters and setters
    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public int getProgramId() {
        return programId;
    }

    public void setProgramId(int programId) {
        this.programId = programId;
    }

    // Override equals and hashCode
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        CourseProgramId that = (CourseProgramId) o;
        return programId == that.programId && Objects.equals(courseId, that.courseId);
    }

    @Override
    public int hashCode() {
        return Objects.hash(courseId, programId);
    }
}