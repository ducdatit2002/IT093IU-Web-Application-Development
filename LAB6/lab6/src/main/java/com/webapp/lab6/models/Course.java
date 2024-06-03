package com.webapp.lab6.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "course")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Course {

    @Id
    @Column(name = "id", length = 255, nullable = false)
    private String id;

    @Column(name = "course_level_id", nullable = false)
    private int courseLevelId;

    @Column(name = "name", length = 255)
    private String name;

    @Column(name = "name_vn", length = 255, nullable = false)
    private String nameVN;

    @Column(name = "credit_theory")
    private Integer creditTheory;

    @Column(name = "credit_lab")
    private Integer creditLab;

    @Column(name = "description", nullable = false)
    private String description;
}