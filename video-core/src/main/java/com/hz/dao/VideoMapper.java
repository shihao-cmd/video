package com.hz.dao;

import com.hz.bean.Video;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface VideoMapper {

    List<Video> selectVideoBySpeakerId(Integer speakerId) throws Exception;

    List<Video> selectVideoByCourseId(Integer courseId) throws Exception;

    List<Video> selectAllVideo(@Param("start") Integer start,
                               @Param("limit") Integer limit) throws Exception;
    Integer selectVideoCount() throws Exception;

    void deleteVideoById(Integer id) throws Exception;

    void updateVideoById(Video video) throws Exception;

    List<Video> selectVideoSearch(@Param("videose") Video video,
                                  @Param("start") Integer start,
                                  @Param("limit") Integer limit) throws Exception;

    Integer selectVideoSearchCount(Video video);

    void deleteVideoByIds(@Param("ids") Integer[] ids);

    void inserVideo(Video video) throws Exception;

    List<Video> selectVideoByIdJoin(@Param("id") Integer id) throws Exception;

    Video selectVideoByVideoId(Integer voideId) throws Exception;
}