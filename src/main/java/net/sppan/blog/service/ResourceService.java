package net.sppan.blog.service;

import net.sppan.blog.entity.Resource;
import net.sppan.blog.entity.ResourceCategory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
@Service
public interface ResourceService {
    Page<Resource> findByStatus(Pageable pageable);

    Page<Resource> findByCategoryIdAndStatus(ResourceCategory resourceCategory, Pageable pageable);
}
