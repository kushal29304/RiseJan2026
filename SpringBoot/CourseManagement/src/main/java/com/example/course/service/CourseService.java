package com.example.course.service;

import com.example.course.dto.CourseResponseDTO;
import com.example.course.entity.Course;

import java.util.List;

public interface CourseService {

    CourseResponseDTO findById(Long id);

    CourseResponseDTO saveCourse(Course course);

    CourseResponseDTO updateCourse(Course course);

    void deleteCourse(Course course);

    List<CourseResponseDTO> getAllCourses();

    List<CourseResponseDTO> getAllCoursesByTitle(String title);
}
