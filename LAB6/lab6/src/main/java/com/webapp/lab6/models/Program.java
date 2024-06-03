package com.webapp.lab6.models;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "program")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Program {

    @Id
    @Column(name = "id", nullable = false)
    private int id;

    @Column(name = "name", length = 255)
    private String name;

    @Column(name = "duration")
    private Integer duration;

    @Column(name = "version", length = 4)
    private String version;

    @Column(name = "major_id")
    private Integer majorId;

    @Column(name = "program_type_id", nullable = false)
    private int programTypeId;

    @Column(name = "valid_from", length = 255)
    private String validFrom;

    // Foreign key relationships can be defined here if needed
    // For example:
    // @ManyToOne
    // @JoinColumn(name = "major_id", insertable = false, updatable = false)
    // private Major major;

    // @ManyToOne
    // @JoinColumn(name = "program_type_id", insertable = false, updatable = false)
    // private ProgramType programType;
}