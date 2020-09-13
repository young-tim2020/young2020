package com.kh.runningdog.member.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.runningdog.member.model.vo.Member;

@Repository("MemberDao")
public class MemberDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public MemberDao() {}


	public ArrayList<Member> selectList() {
		List<Member> list = session.selectList("memberMapper.selectList");
		return (ArrayList<Member>)list;
	}
	
	public Member selectMember(String userId) {
		return session.selectOne("memberMapper.selectMember", userId);
	}
	
	public Member selectLogin(Member member) {
		return session.selectOne("memberMapper.selectLogin", member);
	}
	
	public Member selectUserIdCheck(Member member) {
		return session.selectOne("memberMapper.selectUserIdCheck", member);
	}
	
	public Member selectNicknameCheck(Member member) {
		return session.selectOne("memberMapper.selectNicknameCheck", member);
	}
	
	public Member selectPhoneCheck(Member member) {
		return session.selectOne("memberMapper.selectPhoneCheck", member);
	}
	
	public int insertMember(Member member) {
		return session.insert("memberMapper.insertMember", member);
	}
	
	public int updateMember(Member member) {
		return session.update("memberMapper.updateMember", member);
	}
	

	public Member selectUserIdCheck(String userId) {
		return session.selectOne("memberMapper.selectUserIdCheck", userId);
	}
	
	public Member selectNicknameCheck(String nickname) {
		return session.selectOne("memberMapper.selectNicknameCheck", nickname);
	}

	public Member selectPhoneCheck(String phone) {
		return session.selectOne("memberMapper.selectPhoneCheck", phone);
	}


	public Member selectUserIdPhoneCheck(Member member) {
		return session.selectOne("memberMapper.selectUserIdPhoneCheck", member);
	}


	public Member selectUserPwdCheck(Member member) {
		return session.selectOne("memberMapper.selectUserPwdCheck", member);
	}


	public int updateMemberPwd(Member member) {
		return session.update("memberMapper.updateMemberPwd", member);
	}


	public int updatemyinfo(Member member) {
		return session.update("memberMapper.updatemyinfo", member);
	}


	public int insertLeaveMember(Member member) {
		return session.insert("memberMapper.insertLeaveMember", member);
	}

	public int deleteMember(String userId) {
		return session.delete("memberMapper.deleteMember", userId);
	}


}
