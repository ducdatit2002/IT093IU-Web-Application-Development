package com.webapp.lab6.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "course_program")
@IdClass(CourseProgramId.class)
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CourseProgram {

    @Id
    @Column(name = "course_id", length = 255, nullable = false)
    private String courseId;

    @Id
    @Column(name = "program_id", nullable = false)
    private int programId;

    @Column(name = "course_code", length = 255, nullable = false)
    private String courseCode;

    @Column(name = "course_type_id", nullable = false)
    private int courseTypeId;

    // Foreign key relationships can be defined here if needed
    // For example:
    // @ManyToOne
    // @JoinColumn(name = "course_id", insertable = false, updatable = false)
    // private Course course;

    // @ManyToOne
    // @JoinColumn(name = "course_type_id", insertable = false, updatable = false)
    // private CourseType courseType;

    // @ManyToOne
    // @JoinColumn(name = "program_id", insertable = false, updatable = false)
    // private Program program;
}