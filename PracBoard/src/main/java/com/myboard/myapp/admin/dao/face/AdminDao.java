package com.myboard.myapp.admin.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.myboard.myapp.dto.Admin;
import com.myboard.myapp.dto.Inquiry;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.util.Paging;

public interface AdminDao {

	public int cntAdminByIdPw(Admin admin);

	public int getCntReport(@Param("filter") String filter, @Param("keyword") String keyword);

	public List<Map<Object, String>> getRegulateList(@Param("paging") Paging paging, @Param("filter") String filter, @Param("keyword") String keyword);

	public void regulateComm(int commentNo);

	public void deleteReguComm(int commentNo);

	public int getQnaCnt(String filter);

	public List<Inquiry> getQnaList(@Param("paging") Paging paging, @Param("filter") String filter);

	public int getAdminNo();

	public int getReboardCnt(@Param("filter") String filter, @Param("keyword") String keyword);

	public List<Map<Object, String>> getReBoardList(@Param("paging") Paging paging, @Param("filter") String filter, @Param("keyword") String keyword);

	public int getUserTotalCnt(@Param("filter") String filter, @Param("searchType") String searchType, @Param("keyword") String keyword);

	public List<User> getUserList(@Param("paging") Paging paging, @Param("filter") String filter, @Param("searchType") String searchType, @Param("keyword") String keyword);

	public void updateUserInfo(User user);

	public int getBlackBoardCnt(@Param("filter") String filter, @Param("keyword") String keyword);

	public List<Map<Object, String>> getBoardBlackList(@Param("paging") Paging paging, @Param("filter") String filter, @Param("keyword") String keyword);

	public int deleteBoardRel(int boardNo);


}
