package com.example.course.controller;

import com.example.course.dto.CourseResponseDTO;
import com.example.course.entity.Course;
import com.example.course.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/rest/course")
public class CourseController {

    @Autowired
    CourseService courseService;

    @GetMapping("/list")
    public ResponseEntity<List<CourseResponseDTO>> getAllCourses() {
        try {
            return ResponseEntity.ok(courseService.getAllCourses());
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<CourseResponseDTO> getCourseById(@PathVariable("id") Long id) {
        try {
            return ResponseEntity.ok(courseService.findById(id));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PostMapping("/")
    public ResponseEntity<CourseResponseDTO> saveCourse(@RequestBody Course course) {
        try {
            return ResponseEntity.status(HttpStatus.CREATED).body(courseService.saveCourse(course));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @PutMapping("/")
    public ResponseEntity<CourseResponseDTO> updateCourse(@RequestBody Course course) {
        try {
            return ResponseEntity.ok(courseService.updateCourse(course));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @DeleteMapping("/")
    public ResponseEntity<Void> deleteCourse(@RequestBody Course course) {
        try {
            courseService.deleteCourse(course);
            return ResponseEntity.status(HttpStatus.NO_CONTENT).build();
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }

    @GetMapping("/byTitle")
    public ResponseEntity<List<CourseResponseDTO>> getCoursesByTitle(@RequestParam(name = "title") String title) {
        try {
            return ResponseEntity.ok(courseService.getAllCoursesByTitle(title));
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }
}
