package com.hz.service.impl;

import com.hz.bean.Course;
import com.hz.dao.CourseMapper;
import com.hz.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class CourseServiceImpl implements CourseService {
    @Resource
    private CourseMapper courseMapper;


    @Override
    public List<Course> selectAllCourse() throws Exception {
        return courseMapper.selectAllCourse();
    }

    @Override
    public List<Course> selectAllCourseToTable(Integer page, Integer limit) throws Exception {
        return courseMapper.selectAllCourseToTable((page-1)*limit,limit);
    }

    @Override
    public Integer selectAllCourseCount() throws Exception {
        return courseMapper.selectAllCourseCount();
    }

    @Override
    public void delectCourseById(Integer id) throws Exception {
        courseMapper.delectCourseById(id);
    }

    @Override
    public void updateCourseById(Course course) throws Exception {
        courseMapper.updateCourseById(course);
    }

    @Override
    public void insertCourse(Course course) throws Exception {
        courseMapper.insertCourse(course);
    }

    @Override
    public Course selectCourseByCourseId(Integer voideId) throws Exception {
        return courseMapper.selectCourseByCourseId(voideId);
    }
}
