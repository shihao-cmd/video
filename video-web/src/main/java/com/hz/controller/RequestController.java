package com.hz.controller;

import com.hz.bean.Course;
import com.hz.bean.Speaker;
import com.hz.bean.Subject;
import com.hz.bean.Video;
import com.hz.service.CourseService;
import com.hz.service.SpeakerService;
import com.hz.service.SubjectService;
import com.hz.service.VideoService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class RequestController {
    @Resource
    private VideoService videoService;
    @Resource
    private CourseService courseService;
    @Resource
    private SpeakerService speakerService;
    @Resource
    public SubjectService subjectService;

    @RequestMapping("/")
    public String toIndex(HttpSession session) {
        try {
            List<Subject> subject = subjectService.selectAllSubject();
            session.setAttribute("Subject",subject);
            System.out.println("subject"+subject);
            List<Course> courses = courseService.selectAllCourse();
            System.out.println(courses);
            session.setAttribute("Course",courses);
            List<Speaker> speakers = speakerService.selectAllSpeaker();
            System.out.println(speakers);
            session.setAttribute("Speaker",speakers);
        } catch (Exception e) {
            System.out.println(e);
        }
        return "index.jsp";
    }

    @RequestMapping("toCourse")
    public String toCourse(Integer subjectId,HttpSession session) {
        System.out.println(subjectId);
        try {
            Subject subjectList = subjectService.selectSubjectBySubjectId(subjectId);
            System.out.println(subjectList);
            session.setAttribute("subjectList",subjectList);
        } catch (Exception e) {
            System.out.println(e);
        }
        return "redirect:/course";
    }

    @RequestMapping("course")
    public String course() {
        return "course.jsp";
    }

    @RequestMapping("showVideo")
    public String showVideo(Integer videoId, String subjectName, HttpSession session) {
        session.setAttribute("subjectName",subjectName);
        try {
            Video video = videoService.selectVideoByVideoId(videoId);
            Course course = courseService.selectCourseByCourseId(video.getCourseId());
            session.setAttribute("video",video);
            session.setAttribute("course",course);
        } catch (Exception e) {
            System.out.println(e);
        }
        return "section.jsp";
    }
}
