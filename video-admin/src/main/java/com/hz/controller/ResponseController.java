package com.hz.controller;

import com.hz.bean.*;
import com.hz.service.CourseService;
import com.hz.service.SpeakerService;
import com.hz.service.SubjectService;
import com.hz.service.VideoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class ResponseController {

    @Resource
    private VideoService videoService;
    @Resource
    private CourseService courseService;
    @Resource
    private SubjectService subjectService;
    @Resource
    private SpeakerService speakerService;

    // 视频管理页面 table 表单所有数据
    @RequestMapping("videoList")
    public Map<String,Object> videoList(Integer page, Integer limit){
        System.out.println(page);
        System.out.println(limit);
        Map<String, Object> map = new HashMap<>();
        try {
            List<Video> videos = videoService.selectAllVideo(page, limit);
            Integer count = videoService.selectVideoCount();
            map.put("code",0);
            map.put("data",videos);
            map.put("count",count);
            map.put("msg","视频信息");
            System.out.println(videos);
        } catch (Exception e) {
            System.out.println(e);
        }
        return map;
    }

    // 视频管理页面 单条删除
    @RequestMapping("deleteVideoById")
    public String deleteVideoById(Integer id) {
        System.out.println(id);
        try {
            videoService.deleteVideoById(id);
            System.out.println(0000);
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "1";
    }

    // 视屏管理修改
    @RequestMapping("layerUpdateVideo")
    public String layerUpdateVideo(Video video) {
        System.out.println(video);
        try {
            videoService.updateVideoById(video);
            System.out.println("0000");
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "1";
    }

    // 视频管理页面 条件查询
    @RequestMapping("selectVideoSearch")
    public Map<String,Object> selectVideoSearch(Video video, Model model, Integer page, Integer limit) {
        System.out.println(video);
        System.out.println(page+"----"+limit);
        Map<String, Object> map = new HashMap<>();
        try {
            List<Video> queryVo = videoService.selectVideoSearch(video,page,limit);
            Integer count = videoService.selectVideoSearchCount(video);
            model.addAttribute("queryVo",queryVo);
            map.put("code",0);
            map.put("data",queryVo);
            map.put("count",count);
            map.put("msg","视频信息");
        } catch (Exception e) {
            System.out.println(e);
        }
        return map;
    }

    // 视频管理页面 批量删除
    @RequestMapping("deleteVideoByIds")
    public String deleteVideoByIds(Integer[] ids) {
        System.out.println(Arrays.toString(ids));
        try {
            videoService.deleteVideoByIds(ids);
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "1";
    }

    // 视频管理页面 新增
    @RequestMapping("insertVideo")
    public String insertVideo(Video video) {
        System.out.println(video);
        try {
            videoService.insertVideo(video);
            System.out.println(0);
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }

        return "1";
    }

    // 主讲人管理页面 table 表单所有数据
    @RequestMapping("speakerList")
    public Map<String,Object> speakerList(Integer page, Integer limit){
        System.out.println(page);
        System.out.println(limit);
        Map<String, Object> map = new HashMap<>();
        try {
            List<Speaker> speakers = speakerService.selectAllSpeakerToTable(page, limit);
            Integer count = speakerService.selectAllSpeakerCount();
            map.put("code",0);
            map.put("data",speakers);
            map.put("count",count);
            map.put("msg","视频信息");
            System.out.println(speakers);
        } catch (Exception e) {
            System.out.println(e);
        }
        return map;
    }

    // 主讲人管理 删除
    @RequestMapping("deleteSpeakerById")
    public String deleteSpeakerById(Integer id) {
        System.out.println(id);
        try {
            speakerService.deleteSpeakerById(id);
            System.out.println("del");
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "1";
    }

    // 主讲人管理  新增
    @RequestMapping("insertSpeaker")
    public String insertSpeaker(Speaker speaker) {
        System.out.println(speaker);
        try {
            speakerService.insertSpeaker(speaker);
            System.out.println("insertSpeaker");
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "1";
    }

    // 主讲人管理 修改
    @RequestMapping("layerUpdateSpeaker")
    public String layerUpdateSpeaker(Speaker speaker) {
        System.out.println(speaker);
        try {
            speakerService.updateSpeakerById(speaker);
            System.out.println("updateSpeaker");
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }

        return "1";
    }

    // 课程管理
    @RequestMapping("courseList")
    public Map<String,Object> courseList(Integer page, Integer limit) {
        System.out.println(page);
        System.out.println(limit);
        Map<String, Object> map = new HashMap<>();
        try {
            List<Course> courses = courseService.selectAllCourseToTable(page, limit);
            Integer count = courseService.selectAllCourseCount();
            map.put("code",0);
            map.put("data",courses);
            map.put("count",count);
            map.put("msg","视频信息");
            System.out.println(courses);
        } catch (Exception e) {
            System.out.println(e);
        }
        return map;
    }

    // 课程管理 删除
    @RequestMapping("deleteCourseById")
    public String deleteCourseById(Integer id) {
        System.out.println(id);
        try {
            courseService.delectCourseById(id);
            System.out.println("del");
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "1";
    }

    // 课程管理 新增
    @RequestMapping("insertCourse")
    public String insertCourse(Course course) {
        System.out.println(course);
        try {
            courseService.insertCourse(course);
            System.out.println("courseinsert");
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }

        return "1";
    }

    @RequestMapping("layerUpdateCourse")
    public String layerUpdateCourse(Course course) {
        System.out.println(course);
        try {
            courseService.updateCourseById(course);
            return "0";
        } catch (Exception e) {
            System.out.println(e);
        }
        return "1";
    }
}
