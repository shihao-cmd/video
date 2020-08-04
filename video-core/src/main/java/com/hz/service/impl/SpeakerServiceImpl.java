package com.hz.service.impl;

import com.hz.bean.Speaker;
import com.hz.bean.Video;
import com.hz.dao.SpeakerMapper;
import com.hz.service.SpeakerService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SpeakerServiceImpl implements SpeakerService {
    @Resource
    private SpeakerMapper speakerMapper;

    @Override
    public List<Speaker> selectAllSpeaker() throws Exception {
        return speakerMapper.selectAllSpeaker();
    }

    @Override
    public void deleteSpeakerById(Integer id) throws Exception {
        speakerMapper.deleteSpeakerById(id);
    }

    @Override
    public void insertSpeaker(Speaker speaker) throws Exception {
        speakerMapper.insertSpeaker(speaker);
    }

    @Override
    public void updateSpeakerById(Speaker speaker) throws Exception {
        speakerMapper.layerUpdateSpeaker(speaker);
    }

    @Override
    public List<Speaker> selectAllSpeakerToTable(Integer page, Integer limit) throws Exception {
        return speakerMapper.selectAllSpeakerToTable((page-1)*limit,limit);
    }

    @Override
    public Integer selectAllSpeakerCount() throws Exception {
        return speakerMapper.selectAllSpeakerCount();
    }
}
