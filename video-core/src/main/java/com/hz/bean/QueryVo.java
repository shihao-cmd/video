package com.hz.bean;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class QueryVo {
    private String title;

    private Integer speakerId;

    private Integer courseId;
}
