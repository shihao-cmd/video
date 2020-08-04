package com.hz.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Speaker {

    private Integer id;

    private String speakerName;

    private String speakerJob;

    private String speakerImgUrl;

    private String speakerDesc;

    private List<Video> videos;
}