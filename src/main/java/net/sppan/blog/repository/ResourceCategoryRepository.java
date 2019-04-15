package net.sppan.blog.repository;


import net.sppan.blog.entity.ResourceCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ResourceCategoryRepository  extends JpaRepository<ResourceCategory, Long> {
    List<ResourceCategory> findByTypeAndParentIdAndStatus(int type, long parentId, int status);
}
