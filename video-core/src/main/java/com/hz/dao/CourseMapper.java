package com.hz.dao;

import com.hz.bean.Course;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CourseMapper {

    Course selectCourseById(Integer id) throws Exception;

    List<Course> selectAllCourse() throws Exception;

    List<Course> selectAllCourseToTable(@Param("start") Integer start,
                                        @Param("limit") Integer limit) throws Exception;

    Integer selectAllCourseCount() throws Exception;

    void delectCourseById(Integer id) throws Exception;

    void updateCourseById(Course course) throws Exception;

    void insertCourse(Course course) throws Exception;

    List<Course> selectCourseByIdJoinVideo(@Param("id") Integer id) throws Exception;

    Course selectCourseByCourseId(Integer voideId);
}