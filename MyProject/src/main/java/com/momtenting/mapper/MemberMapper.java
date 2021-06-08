package com.momtenting.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import com.momtenting.domain.AuthVo;
import com.momtenting.domain.MemberVo;

public interface MemberMapper {
	
	
	@Insert("insert into tbl_member(userid, userpw, username, phonenumber) values(#{userid}, #{userpw}, #{userName}, #{phonenumber})")
	void insert(MemberVo memberVo);
	
	@Insert("insert into tbl_member_auth(userid, auth) values(#{userid}, 'ROLE_MEMBER')")
	void insertAuth(AuthVo authVo);
	
	@Update("update tbl_member set username = #{userName}, phonenumber = #{phonenumber}, updatedate=sysdate where userid = #{userid}")
	int update(MemberVo memberVo);
	
	@Delete("delete from tbl_member where userid = #{userid}")
	int delete(String userid);
	
	MemberVo read(String userid);
	
	List<MemberVo> getList();
}
