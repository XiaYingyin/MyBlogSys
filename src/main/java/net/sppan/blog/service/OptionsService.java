package net.sppan.blog.service;

import net.sppan.blog.entity.Options;
import net.sppan.blog.exception.ServiceException;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OptionsService {

	List<Options> findAll();

	Page<Options> findAll(PageRequest pageRequest);

	/**
	 * 设置关于我
	 * @param content
	 */
	void saveAboutMe(String content);

	Options findById(long id);

	/**
	 * 新增或者更新
	 * @param options
	 */
	void saveOrUpdate(Options options) throws ServiceException;


	Options findByOptionKey(String key);
}
