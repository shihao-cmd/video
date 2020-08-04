package com.hz.service;

import com.hz.bean.Speaker;
import com.hz.bean.Video;

import java.util.List;

public interface SpeakerService {

    List<Speaker> selectAllSpeaker() throws Exception;

    void deleteSpeakerById(Integer id) throws Exception;

    void insertSpeaker(Speaker speaker) throws Exception;

    void updateSpeakerById(Speaker speaker) throws Exception;

    List<Speaker> selectAllSpeakerToTable(Integer page, Integer limit) throws Exception;

    Integer selectAllSpeakerCount() throws Exception;
}
