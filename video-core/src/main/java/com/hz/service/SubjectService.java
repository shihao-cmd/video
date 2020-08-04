package com.hz.service;

import com.hz.bean.Subject;

import java.util.List;

public interface SubjectService {

    List<Subject> selectAllSubject() throws Exception;

    Subject selectSubjectBySubjectId(Integer subjectId) throws Exception;
}
