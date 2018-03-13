package com.attend.controller;

import com.attend.util.ResponseJsonUtil;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.InputStream;
import java.util.Map;
import java.util.UUID;

/**
 * Created by bowen on 2018-03-02 22:12
 */
@Controller
@RequestMapping("/upload/")
public class UploadController {

    private static String UPLOADS_DIR = "/uploads/";

    /**
     * 上传文件会自动绑定到MultipartFile中
     * @param request
     * @param description
     * @param file
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/uploadForEditor", method= RequestMethod.POST)
    public void upload(HttpServletRequest request, MultipartFile file, HttpServletResponse response) throws Exception {
        String jsonFmt = "{\"error\":0,\"message\":\"%s\",\"url\":\"%s\"}";
        String json = "";

        // 上传图片
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (Map.Entry<String, MultipartFile> entity : fileMap.entrySet()) {
            // 上传文件名
            MultipartFile mf = entity.getValue();
            long size = mf.getSize();
            if (0 != size) {
                if (size > 2 * 1024 * 1024) {
                    json = String.format(jsonFmt, "上传文件大于2M,请重新选择！", null);
                } else {
                    //上传文件路径
                    String path = request.getServletContext().getRealPath(UPLOADS_DIR);
                    //上传文件名
                    String filename = file.getOriginalFilename();
                    File filepath = new File(path, filename.trim());
                    //判断路径是否存在，如果不存在就创建一个
                    if (!filepath.getParentFile().exists()) {
                        filepath.getParentFile().mkdirs();
                    }
                    //将上传文件保存到一个目标文件当中
                    file.transferTo(new File(path + File.separator + filename));
                    json = String.format(jsonFmt, "上传成功！", UPLOADS_DIR + filename);
                }
            } else {
                json = String.format(jsonFmt, "请选择文件", null);
            }
            ResponseJsonUtil.writeJson2Response(json, request, response);
        }

    }
}
