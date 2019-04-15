package net.sppan.blog.service.impl;

import net.sppan.blog.entity.Logs;
import net.sppan.blog.repository.LogRepository;
import net.sppan.blog.service.LogService;
import org.hibernate.service.spi.ServiceException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class LogServiceImpl implements LogService {

    @Resource
    private LogRepository logRepository;
    @Override
    public Page<Logs> findAll(PageRequest pageRequest) {
        return logRepository.findAll(pageRequest);
    }

    @Override
    public Logs findById(long id) {
        return logRepository.findOne(id);
    }

    @Override
    public void remove(Long id) {
        logRepository.delete(id);
    }

    @Override
    public int batchRemove(Long[] ids) {
        int count = 0;
        for (Long id : ids) {
            logRepository.delete(id);
            count ++ ;
        }
        return count;
    }

    @Override
    public void saveOrUpdate(Logs log) throws ServiceException {
        if(log == null) {
            throw new ServiceException("对象不能为空");
        }
        logRepository.saveAndFlush(log);
    }
}
