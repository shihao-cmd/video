package com.hz.service.impl;

import com.hz.bean.Video;
import com.hz.dao.VideoMapper;
import com.hz.service.VideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class VideoServiceImpl implements VideoService {
    @Resource
    private VideoMapper videoMapper;


    @Override
    public List<Video> selectAllVideo(Integer page, Integer limit)  {
        try {
            return videoMapper.selectAllVideo((page-1)*limit, limit);
        } catch (Exception e) {
            System.out.println("selectAll"+e);
        }
        return null;
    }

    @Override
    public Integer selectVideoCount() throws Exception {
        return videoMapper.selectVideoCount();
    }

    @Override
    public void deleteVideoById(Integer id) throws Exception {
        videoMapper.deleteVideoById(id);
    }

    @Override
    public void updateVideoById(Video video) throws Exception {
        videoMapper.updateVideoById(video);
    }

    @Override
    public List<Video> selectVideoSearch(Video video,Integer page, Integer limit) throws Exception {
        return videoMapper.selectVideoSearch(video,(page-1)*limit,limit);
    }

    @Override
    public Integer selectVideoSearchCount(Video video) throws Exception {
        return videoMapper.selectVideoSearchCount(video);
    }

    @Override
    public void deleteVideoByIds(Integer[] ids) throws Exception {
        videoMapper.deleteVideoByIds(ids);
    }

    @Override
    public void insertVideo(Video video) throws Exception {
        videoMapper.inserVideo(video);
    }

    @Override
    public Video selectVideoByVideoId(Integer voideId) throws Exception {
        return videoMapper.selectVideoByVideoId(voideId);
    }
}
