package net.sppan.blog.service;

import net.sppan.blog.entity.Menu;
import net.sppan.blog.exception.ServiceException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public interface MenuService  {

    Page<Menu> findAll(PageRequest pageRequest);

    List<Menu> findAllByMenu(Sort sort);

    Menu findById(long id);

    /**
     * 新增或者更新
     * @param menu
     */
    void saveOrUpdate(Menu menu) throws ServiceException;
}
