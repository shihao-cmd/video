package com.hz.service;

import com.hz.bean.Course;

import java.util.List;

public interface CourseService {

    List<Course> selectAllCourse() throws Exception;

    List<Course> selectAllCourseToTable(Integer page, Integer limit) throws Exception;

    Integer selectAllCourseCount() throws Exception;

    void delectCourseById(Integer id) throws Exception;

    void updateCourseById(Course course) throws Exception;

    void insertCourse(Course course) throws Exception;

    Course selectCourseByCourseId(Integer voideId) throws Exception;
}
