package net.sppan.blog.repository;

import net.sppan.blog.entity.Logs;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LogRepository extends JpaRepository<Logs, Long> {
}
