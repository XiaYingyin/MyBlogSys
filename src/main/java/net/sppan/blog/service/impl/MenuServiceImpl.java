package net.sppan.blog.service.impl;

import net.sppan.blog.entity.Menu;
import net.sppan.blog.exception.ServiceException;
import net.sppan.blog.repository.MenuRepository;
import net.sppan.blog.service.MenuService;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {

    @Resource
    private MenuRepository menuRepository;

    @Override
    public Page<Menu> findAll(PageRequest pageRequest) {
        return menuRepository.findAll(pageRequest);
    }

    @Override
    public List<Menu> findAllByMenu(Sort sort) {
        return menuRepository.findAll(sort);
    }

    @Override
    public Menu findById(long id) {
        return menuRepository.findOne(id);
    }

    @Override
    public void saveOrUpdate(Menu menu) throws ServiceException {
        if(menu == null){
            throw new ServiceException("不能为空");
        }
        menuRepository.saveAndFlush(menu);
    }
}
