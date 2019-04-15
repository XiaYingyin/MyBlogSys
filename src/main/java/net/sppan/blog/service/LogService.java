package net.sppan.blog.service;

import net.sppan.blog.entity.Logs;
import org.hibernate.service.spi.ServiceException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
@Service
public interface LogService {

    Page<Logs> findAll(PageRequest pageRequest);

    Logs findById(long id);

    void remove(Long id);

    int batchRemove(Long[] ids);
    /**
     * 新增或者更新
     * @param log
     */
    void saveOrUpdate(Logs log) throws ServiceException;
}
