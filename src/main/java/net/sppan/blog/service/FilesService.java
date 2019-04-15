package net.sppan.blog.service;

import net.sppan.blog.entity.Files;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface FilesService {

    /**
     * 后端分页显示
     * @param pageable
     * @return
     */
    Page<Files> findAll(Pageable pageable);

    /**
     * 删除
     * @param id
     */
    void delete(Long id);

    /**
     * 新增或修改
     * @param files
     */
    void saveOrUpdate(Files files);

    /**
     * 得到对象
     * @param id
     * @return
     */
    Files getFiles(Long id);

    /**
     * 前端页面显示
     * @param pageable
     * @param status
     * @return
     */
    Page<Files> findAll(Pageable pageable,Integer status);

    /**
     * 前端轮播图片轮播显示
     * @param pageable
     * @param status
     * @param carousel
     * @return
     */
    Page<Files> findAll(Pageable pageable,Integer status,Integer carousel);


    /**
     * 改变状态
     * @param id
     * @param type
     */
    void change(Long id, String type);

}
