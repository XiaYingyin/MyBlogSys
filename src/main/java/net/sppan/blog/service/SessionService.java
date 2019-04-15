package net.sppan.blog.service;

import org.springframework.stereotype.Service;

import net.sppan.blog.entity.Session;
@Service
public interface SessionService {

	Session findBySessionId(String sessionId);

}
