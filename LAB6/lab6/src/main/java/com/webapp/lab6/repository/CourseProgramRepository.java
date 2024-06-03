package com.webapp.lab6.repository;

import com.webapp.lab6.models.CourseProgram;
import com.webapp.lab6.models.CourseProgramId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CourseProgramRepository extends JpaRepository<CourseProgram, CourseProgramId> {
}