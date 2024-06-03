package com.webapp.lab6.controllers;

import com.webapp.lab6.models.Course;
import com.webapp.lab6.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/courses")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;

    // Lấy danh sách tất cả Course
    @GetMapping
    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    // Lấy Course theo id
    @GetMapping("/{id}")
    public ResponseEntity<Course> getCourseById(@PathVariable String id) {
        Optional<Course> course = courseRepository.findById(id);
        return course.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    // Tạo mới Course
    @PostMapping
    public Course createCourse(@RequestBody Course course) {
        return courseRepository.save(course);
    }

    // Cập nhật Course theo id
    @PutMapping("/{id}")
    public ResponseEntity<Course> updateCourse(@PathVariable String id, @RequestBody Course courseDetails) {
        Optional<Course> course = courseRepository.findById(id);
        if (course.isPresent()) {
            Course existingCourse = course.get();
            existingCourse.setCourseLevelId(courseDetails.getCourseLevelId());
            existingCourse.setName(courseDetails.getName());
            existingCourse.setNameVN(courseDetails.getNameVN());
            existingCourse.setCreditTheory(courseDetails.getCreditTheory());
            existingCourse.setCreditLab(courseDetails.getCreditLab());
            existingCourse.setDescription(courseDetails.getDescription());
            return ResponseEntity.ok(courseRepository.save(existingCourse));
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    // Xóa Course theo id
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCourse(@PathVariable String id) {
        Optional<Course> course = courseRepository.findById(id);
        if (course.isPresent()) {
            courseRepository.delete(course.get());
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}