package net.sppan.blog.service.impl;

import net.sppan.blog.entity.Files;
import net.sppan.blog.repository.FilesRepository;
import net.sppan.blog.service.FilesService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service
public class FilesServiceImpl implements FilesService {

    @Resource
    private FilesRepository filesRepository;
    @Override
    public Page<Files> findAll(Pageable pageable) {
        return filesRepository.findAll(pageable);
    }

    @Override
    public void delete(Long id) {
        filesRepository.delete(id);
    }

    @Override
    public void saveOrUpdate(Files files) {
        files.setThumb(files.getSrc());
        if(files.getPid() == null) {
            files.setCreateAt(new Date());
        }
        filesRepository.saveAndFlush(files);
    }

    @Override
    public Files getFiles(Long id) {
        return filesRepository.findOne(id);
    }

    @Override
    public Page<Files> findAll(Pageable pageable, Integer status) {
        return filesRepository.findByStatusIs(pageable,status);
    }

    @Override
    public Page<Files> findAll(Pageable pageable, Integer status, Integer carousel) {
        return filesRepository.findByStatusIsAndCarouselIs(pageable,status,carousel);
    }

    @Override
    public void change(Long id, String type) {
        Files one = filesRepository.findOne(id);
        if("status".equals(type)) {
            one.setStatus(one.getStatus() == 0 ? 1 : 0);
        } else if("carousel".equals(type)) {
            one.setCarousel(one.getCarousel() == 0 ? 1 : 0);
        }
        filesRepository.save(one);
    }
}
