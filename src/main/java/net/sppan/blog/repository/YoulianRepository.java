package net.sppan.blog.repository;

import net.sppan.blog.entity.Youlian;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface YoulianRepository extends JpaRepository<Youlian, Long> {

	/**
	 * 查询所有可见
	 * @param status
	 * @return
	 */
	List<Youlian> findAllByStatus(int status);


}
