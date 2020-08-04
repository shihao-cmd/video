package com.hz.service;

import com.hz.bean.Video;

import java.util.List;

public interface VideoService {

    List<Video> selectAllVideo(Integer page, Integer limit) throws Exception;

    Integer selectVideoCount() throws Exception;

    void deleteVideoById(Integer id) throws Exception;

    void updateVideoById(Video video) throws Exception;

    List<Video> selectVideoSearch(Video video,Integer page, Integer limit) throws Exception;

    Integer selectVideoSearchCount(Video video) throws Exception;

    void deleteVideoByIds(Integer[] ids) throws Exception;

    void insertVideo(Video video) throws Exception;

    Video selectVideoByVideoId(Integer voideId) throws Exception;
}
