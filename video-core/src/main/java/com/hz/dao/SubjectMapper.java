package com.hz.dao;

import com.hz.bean.Subject;

import java.util.List;

public interface SubjectMapper {

    Subject selectSubjectById(Integer id) throws Exception;

    List<Subject> selectAllSubject() throws Exception;

    Subject selectSubjectBySubjectId(Integer subjectId);
}