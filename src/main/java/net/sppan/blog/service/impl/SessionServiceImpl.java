package net.sppan.blog.service.impl;

import net.sppan.blog.entity.Session;
import net.sppan.blog.repository.SessionRepository;
import net.sppan.blog.service.SessionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class SessionServiceImpl implements SessionService {
	
	@Resource
	private SessionRepository sessionRepository;

	@Override
	public Session findBySessionId(String sessionId) {
		return sessionRepository.findBySessionId(sessionId);
	}

}
