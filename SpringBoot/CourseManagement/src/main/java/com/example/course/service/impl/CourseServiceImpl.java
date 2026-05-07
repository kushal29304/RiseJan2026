package com.example.course.service.impl;

import com.example.course.dto.CourseResponseDTO;
import com.example.course.entity.Course;
import com.example.course.repository.CourseRepository;
import com.example.course.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    CourseRepository courseRepository;

    @Override
    public CourseResponseDTO findById(Long id) {
        Optional<Course> course = courseRepository.findById(id);
        return mapToDto(course.get());
    }

    @Override
    public CourseResponseDTO saveCourse(Course course) {
        Course savedCourse = courseRepository.save(course);
        return mapToDto(savedCourse);
    }

    @Override
    public CourseResponseDTO updateCourse(Course course) {
        Course updatedCourse = courseRepository.save(course);
        return mapToDto(updatedCourse);
    }

    @Override
    public void deleteCourse(Course course) {
        courseRepository.delete(course);
    }

    @Override
    public List<CourseResponseDTO> getAllCourses() {
        List<Course> courses = courseRepository.findAll();
        List<CourseResponseDTO> courseList = new ArrayList<>();
        for (Course course : courses) {
            courseList.add(mapToDto(course));
        }
        return courseList;
    }

    @Override
    public List<CourseResponseDTO> getAllCoursesByTitle(String title) {
        // Custom Finder Method  -> findByTitle(title)
        // JPQL                  -> findCourseByTitle(title)
        // Native Query          -> findCourseByTitleNative(title)
        List<Course> courses = courseRepository.findCourseByTitleNative(title);
        List<CourseResponseDTO> courseList = new ArrayList<>();
        for (Course course : courses) {
            courseList.add(mapToDto(course));
        }
        return courseList;
    }

    private CourseResponseDTO mapToDto(Course course) {
        CourseResponseDTO dto = new CourseResponseDTO();
        dto.setId(course.getId());
        dto.setTitle(course.getTitle());
        dto.setInstructor(course.getInstructor());
        dto.setDuration(course.getDuration());
        return dto;
    }
}
