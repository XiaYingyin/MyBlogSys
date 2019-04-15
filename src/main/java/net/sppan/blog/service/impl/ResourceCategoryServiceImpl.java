package net.sppan.blog.service.impl;

import net.sppan.blog.entity.ResourceCategory;
import net.sppan.blog.repository.ResourceCategoryRepository;
import net.sppan.blog.service.ResourceCategoryService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.Collection;
import java.util.List;

@Service
public class ResourceCategoryServiceImpl implements ResourceCategoryService {

    @Resource
    ResourceCategoryRepository resourceCategoryRepository;

    @Override
    public List<ResourceCategory> findAllResourceCategorys(int type) {
        List<ResourceCategory> categorys = resourceCategoryRepository.findByTypeAndParentIdAndStatus(type, 0, 0);
        if (CollectionUtils.isEmpty(categorys)) return null;
        for (ResourceCategory category : categorys) {
            category.setChilds(resourceCategoryRepository.findByTypeAndParentIdAndStatus(type, category.getId(), 0));
        }
        return categorys;
    }
}
