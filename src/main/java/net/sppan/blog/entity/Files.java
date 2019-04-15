package net.sppan.blog.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import net.sppan.blog.common.Constants;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tb_file")
public class Files implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long pid;

    /**
     * 图片路径
     */
    private String src;

    /**
     * 缩略图
     */
    private String thumb;

    @Temporal(TemporalType.TIMESTAMP)
    @JsonFormat(pattern = Constants.DATETIME_FORMAT, timezone = "GMT+8")
    private Date createAt;

    /**
     * 图片名称
     */
    private String alt;

    /**
     * 0 显示 1 隐藏
     */
    @Column(nullable = false, columnDefinition = "Integer default 0")
    private Integer status;

    /**
     * 图片描述
     */
    private String description;

    /**
     * 标题描述
     */
    private String tiltle;

    /**
     * 是否为轮播图片 0 不设置 1 设置
     */
    @Column(nullable = false, columnDefinition = "Integer default 0")
    private Integer carousel;

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getSrc() {
        return src;
    }

    public void setSrc(String src) {
        this.src = src;
    }

    public String getThumb() {
        return thumb;
    }

    public void setThumb(String thumb) {
        this.thumb = thumb;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public String getAlt() {
        return alt;
    }

    public void setAlt(String alt) {
        this.alt = alt;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTiltle() {
        return tiltle;
    }

    public void setTiltle(String tiltle) {
        this.tiltle = tiltle;
    }

    public Integer getCarousel() {
        return carousel;
    }

    public void setCarousel(Integer carousel) {
        this.carousel = carousel;
    }
}
