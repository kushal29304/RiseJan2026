package com.example.course.repository;

import com.example.course.entity.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course, Long> {

    // Custom Finder Method
    List<Course> findByTitle(String title);

    // JPQL
    @Query("select c from Course c where c.title = :t")
    List<Course> findCourseByTitle(@Param("t") String title);

    // Native Query
    @Query(value = "select * from Course where course_title = :t", nativeQuery = true)
    List<Course> findCourseByTitleNative(@Param("t") String title);
}
