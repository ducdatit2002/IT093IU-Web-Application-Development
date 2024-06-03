package com.webapp.lab6.controllers;

import com.webapp.lab6.models.Course;
import com.webapp.lab6.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/courses")
public class WebController {

    @Autowired
    private CourseRepository courseRepository;

    @GetMapping
    public String getAllCourses(Model model) {
        List<Course> courses = courseRepository.findAll();
        model.addAttribute("courses", courses);
        return "courses";
    }

    @GetMapping("/new")
    public String showAddCourseForm(Model model) {
        model.addAttribute("course", new Course());
        return "course_form";
    }

    @GetMapping("/edit/{id}")
    public String showEditCourseForm(@PathVariable String id, Model model) {
        Optional<Course> course = courseRepository.findById(id);
        if (course.isPresent()) {
            model.addAttribute("course", course.get());
            return "course_form";
        } else {
            return "redirect:/courses";
        }
    }

    @PostMapping
    public String saveCourse(@ModelAttribute Course course) {
        courseRepository.save(course);
        return "redirect:/courses";
    }

    @GetMapping("/delete/{id}")
    public String deleteCourse(@PathVariable String id) {
        Optional<Course> course = courseRepository.findById(id);
        course.ifPresent(value -> courseRepository.delete(value));
        return "redirect:/courses";
    }
}