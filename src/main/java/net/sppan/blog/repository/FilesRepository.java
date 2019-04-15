package net.sppan.blog.repository;

import net.sppan.blog.entity.Files;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface FilesRepository extends JpaRepository<Files,Long> {

    Page<Files> findByStatusIs(Pageable pageable,Integer status);

    Page<Files> findByStatusIsAndCarouselIs(Pageable pageable,Integer status,Integer carouse);

    /**
     * 模糊查询
     * @param searchText
     * @return
     */
    @Query("select a from Files a where a.pid = ?1 or a.alt like ?1 or a.tiltle like ?1")
    List<Files> search(@Param("searchText")String searchText);
}
