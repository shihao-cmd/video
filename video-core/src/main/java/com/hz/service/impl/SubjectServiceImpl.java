package com.hz.service.impl;

import com.hz.bean.Subject;
import com.hz.dao.SubjectMapper;
import com.hz.service.SubjectService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SubjectServiceImpl implements SubjectService {
    @Resource
    private SubjectMapper subjectMapper;

    @Override
    public List<Subject> selectAllSubject() throws Exception {
        return subjectMapper.selectAllSubject();
    }

    @Override
    public Subject selectSubjectBySubjectId(Integer subjectId) throws Exception {
        return subjectMapper.selectSubjectBySubjectId(subjectId);
    }
}
