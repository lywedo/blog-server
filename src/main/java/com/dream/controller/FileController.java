package com.dream.controller;

import com.dream.common.config.MinioParam;
import com.dream.common.lang.Result;
import io.minio.MinioClient;
import io.minio.ObjectStat;
import io.minio.PutObjectOptions;
import io.swagger.annotations.ApiOperation;
import lombok.SneakyThrows;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.net.URLEncoder;


@RestController
public class FileController {
    @Autowired
    private MinioClient minioClient;

    @Autowired
    private MinioParam minioParam;

    /**
     * 下载文件
     * @author 溪云阁  void
     */
    @ApiOperation(value = "下载文件")
    @GetMapping(value = "/download")
    @SneakyThrows(Exception.class)
    public void download(@RequestParam("fileName") String fileName, HttpServletResponse response) {
        InputStream in = null;
        final ObjectStat stat = minioClient.statObject(minioParam.getBucketName(), fileName);
        response.setContentType(stat.contentType());
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
        in = minioClient.getObject(minioParam.getBucketName(), fileName);
        IOUtils.copy(in, response.getOutputStream());
        in.close();
    }

    /**
     * 上传文件
     * @author 溪云阁
     * @param file
     * @return
     * @throws Exception ResponseMsg<String>
     */
    @ApiOperation(value = "上传文件")
    @PostMapping(value = "/upload")
    @SneakyThrows(Exception.class)
    public Result upload(@RequestParam("file") MultipartFile file) throws Exception {
        if (file.isEmpty()) {
            return Result.fail("上传文件不能为空");
        } else {
            // 得到文件流
            final InputStream is = file.getInputStream();
            // 文件名
            final String fileName = String.valueOf(System.nanoTime());
            // 把文件放到minio的boots桶里面
            minioClient.putObject(minioParam.getBucketName(), fileName, is, new PutObjectOptions(is.available(), -1));
            // 关闭输入流
            is.close();
            return Result.succ(minioParam.getUrl() + "/" + minioParam.getBucketName() + "/" + fileName);
        }
    }

    /**
     * 删除文件
     * @author 溪云阁
     * @param fileName
     * @return ResponseMsg<String>
     */
    @ApiOperation(value = "删除文件")
    @GetMapping(value = "/delete", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @SneakyThrows(Exception.class)
    public Result delete(@RequestParam("fileName") String fileName) {
        minioClient.removeObject(minioParam.getBucketName(), fileName);
        return Result.succ("删除成功");
    }

}

