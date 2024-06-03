package com.webapp.lab6.controllers;

import com.webapp.lab6.models.CourseProgram;
import com.webapp.lab6.models.CourseProgramId;
import com.webapp.lab6.repository.CourseProgramRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/course-programs")
public class CourseProgramController {

    @Autowired
    private CourseProgramRepository courseProgramRepository;

    // Lấy danh sách tất cả CourseProgram
    @GetMapping
    public List<CourseProgram> getAllCoursePrograms() {
        return courseProgramRepository.findAll();
    }

    // Lấy CourseProgram theo id
    @GetMapping("/{courseId}/{programId}")
    public ResponseEntity<CourseProgram> getCourseProgramById(@PathVariable String courseId, @PathVariable int programId) {
        CourseProgramId id = new CourseProgramId(courseId, programId);
        Optional<CourseProgram> courseProgram = courseProgramRepository.findById(id);
        return courseProgram.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Tạo mới CourseProgram
    @PostMapping
    public CourseProgram createCourseProgram(@RequestBody CourseProgram courseProgram) {
        return courseProgramRepository.save(courseProgram);
    }

    // Cập nhật CourseProgram theo id
    @PutMapping("/{courseId}/{programId}")
    public ResponseEntity<CourseProgram> updateCourseProgram(@PathVariable String courseId, @PathVariable int programId, @RequestBody CourseProgram courseProgramDetails) {
        CourseProgramId id = new CourseProgramId(courseId, programId);
        Optional<CourseProgram> courseProgram = courseProgramRepository.findById(id);
        if (courseProgram.isPresent()) {
            CourseProgram existingCourseProgram = courseProgram.get();
            existingCourseProgram.setCourseCode(courseProgramDetails.getCourseCode());
            existingCourseProgram.setCourseTypeId(courseProgramDetails.getCourseTypeId());
            return ResponseEntity.ok(courseProgramRepository.save(existingCourseProgram));
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Xóa CourseProgram theo id
    @DeleteMapping("/{courseId}/{programId}")
    public ResponseEntity<Void> deleteCourseProgram(@PathVariable String courseId, @PathVariable int programId) {
        CourseProgramId id = new CourseProgramId(courseId, programId);
        Optional<CourseProgram> courseProgram = courseProgramRepository.findById(id);
        if (courseProgram.isPresent()) {
            courseProgramRepository.delete(courseProgram.get());
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}