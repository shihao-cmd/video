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
    public String toLogin(){
        return "login.jsp";
    }

    @RequestMapping("/toIndex")
    public String toIndex(HttpSession session) {
//        return "login.jsp";
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

    @RequestMapping("VideoLists")
    public String VideoLists() {
        return "redirect:/selectVideo";
    }

    @RequestMapping("selectVideo")
    public String selectVideoList(){
        return "video.jsp";
    }

    @RequestMapping("SpeakerLists")
    public String SpeakerLists() {
        return "redirect:/selectSpeaker";
    }

    @RequestMapping("selectSpeaker")
    public String selectSpeaker(){
        return "speaker.jsp";
    }

    @RequestMapping("CourseLists")
    public String CourseLists() {
        return "redirect:/selectCourse";
    }

    @RequestMapping("selectCourse")
    public String selectcourse(HttpSession session){
        return "course.jsp";
    }
}
