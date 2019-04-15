package net.sppan.blog.service.impl;

import net.sppan.blog.entity.ResourceCategory;
import net.sppan.blog.repository.ResourceRepository;
import net.sppan.blog.service.ResourceService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ResourceServiceImpl implements ResourceService{
    @Resource
    private ResourceRepository resourceRepository;
    @Override
    public Page<net.sppan.blog.entity.Resource> findByStatus(Pageable pageable) {
        return resourceRepository.findByStatus(0, pageable);
    }

    @Override
    public Page<net.sppan.blog.entity.Resource> findByCategoryIdAndStatus(ResourceCategory resourceCategory, Pageable pageable) {
        return resourceRepository.findByResourceCategoryAndStatus(resourceCategory, 0, pageable);
    }
}
