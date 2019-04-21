package net.sppan.blog.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
// 用于配置博客文件的存储路径
@Component
@ConfigurationProperties(prefix = BlogProperties.PREFIX)
public class BlogProperties {

    public static final String PREFIX = "blog";

    private Boolean kaptchaOpen = false;

    private String fileUploadPath;

    public String getFileUploadPath() {
            return fileUploadPath;
    }

    public void setFileUploadPath(String fileUploadPath) {
        this.fileUploadPath = fileUploadPath;
    }

    public Boolean getKaptchaOpen() {
        return kaptchaOpen;
    }

}
