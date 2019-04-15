package net.sppan.blog.repository;


import net.sppan.blog.entity.Resource;
import net.sppan.blog.entity.ResourceCategory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ResourceRepository extends JpaRepository<Resource, Long> {
    Page<Resource> findByStatus(int status, Pageable pageable);

    Page<Resource> findByResourceCategoryAndStatus(ResourceCategory resourceCategory, int status, Pageable pageable);
}
