package net.sppan.blog.service;

import net.sppan.blog.entity.ResourceCategory;

import java.util.List;

import org.springframework.stereotype.Service;
@Service
public interface ResourceCategoryService {

    List<ResourceCategory> findAllResourceCategorys(int type);
}
