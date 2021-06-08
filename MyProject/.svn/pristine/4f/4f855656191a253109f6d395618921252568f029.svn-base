package com.momtenting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.momtenting.domain.AuthVo;
import com.momtenting.domain.MemberVo;
import com.momtenting.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired @Qualifier("BCryptPasswordEncoder")
	private PasswordEncoder encoder;
	
	@Override
	@Transactional
	public void register(MemberVo memberVo) {
		AuthVo authVo = new AuthVo();
		log.info("service register...." + memberVo);
		String encodePw = encoder.encode(memberVo.getUserpw());
		memberVo.setUserpw(encodePw);
		log.info("after pw encode...." + memberVo);
		memberMapper.insert(memberVo);
		authVo.setUserid(memberVo.getUserid());
		memberMapper.insertAuth(authVo);
	}

	@Override
	public MemberVo get(String username) {
		log.info("get...." + username);
		MemberVo memberVo = memberMapper.read(username);
		return memberVo;
	}

	@Override
	public boolean update(MemberVo memberVo) {
		log.info("member update..." + memberVo);
		
		return memberMapper.update(memberVo) > 0;
	}

	@Override
	public boolean delete(String userid) {
		log.info("member delete..." + userid);
		return memberMapper.delete(userid) > 0;
	}
	
	
	
	
	
	
}
