package com.hz.dao;

import com.hz.bean.Speaker;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SpeakerMapper {

    Speaker selectSpeakerById(Integer id) throws Exception;

    List<Speaker> selectAllSpeaker() throws Exception;

    void deleteSpeakerById(Integer id);

    void insertSpeaker(Speaker speaker) throws Exception;

    void layerUpdateSpeaker(Speaker speaker) throws Exception;

    List<Speaker> selectAllSpeakerToTable(@Param("start") Integer start,
                                          @Param("limit") Integer limit) throws Exception;

    Integer selectAllSpeakerCount() throws Exception;
}