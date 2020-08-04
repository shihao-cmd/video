package com.hz.controller;

import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
public class FileuploadController {

    @ResponseBody
    @RequestMapping("/fileUpload")
    public Map<String,Object> upload(MultipartFile file) throws Exception {
        // 获取图片名称
        String fileName = System.currentTimeMillis()+file.getOriginalFilename();

        //通过ftp与linux建立连接（linux需要支持ftp）
        //将图片通过 ftp 上传到 linux的指定目录  (/usr/local/server/nginx/files/imgs)
        // 通过ftp请求与linux建立连接
        FTPClient ftpClient = new FTPClient();
        ftpClient.connect("101.200.234.155",21);
        // Linux的登录账号密码
        boolean state = ftpClient.login("root","Sh1998609");

        // 返回200 -299 表示正确
        int replyCode = ftpClient.getReplyCode();
        //200—299
        if(FTPReply.isPositiveCompletion( replyCode )){
            //设置编码
            ftpClient.setControlEncoding("UTF-8");
            //设置被动模式（必须）
            ftpClient.enterLocalPassiveMode();

            //设置文件类型为二进制
            ftpClient.setFileType(FTPClient.BINARY_FILE_TYPE);
            //设置工作目录（文件上传之后存储目录）
            ftpClient.changeWorkingDirectory("/usr/local/server/nginx/files/imgs/Video");

            //开始文件上传
            InputStream inputStream = file.getInputStream();
            boolean b = ftpClient.storeFile(fileName, inputStream);
            inputStream.close();
        }
        ftpClient.logout();

        //将图片访问路径保存到数据库
        String urlPath = "http://101.200.234.155/imgs/Video/" + fileName;


        //将图片路径  和 图片存储在数据库的id 返回给前端
        Map<String , Object> map = new HashMap<>();
        map.put("urlPath",urlPath);

        return map;
    }

}
