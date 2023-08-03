package com.myboard.myapp.admin.service.face;

import java.util.List;
import java.util.Map;

import com.myboard.myapp.dto.Admin;
import com.myboard.myapp.dto.Inquiry;
import com.myboard.myapp.dto.User;
import com.myboard.myapp.util.Paging;

public interface AdminService {

	public boolean getLogin(Admin admin);

	public Paging getCntRegulate(int curPage, String filter, String keyword);

	public List<Map<Object, String>> getRegulateList(Paging paging, String filter, String keyword);

	public void regulateComment(int commentNo);

	public void deleteRegulate(int commentNo);

	public Paging getInquiryCnt(int curPage, String filter);

	public List<Inquiry> getQnAList(Paging paging, String filter);

	public int getAdminNo();

	public Paging getCntReBoard(int curPage, String filter, String keyword);

	public List<Map<Object, String>> getRegulateBoardList(Paging paging, String filter, String keyword);

	public Paging getUserCnt(int curPage, String filter, String searchType, String keyword);

	public List<User> getUserList(Paging paging, String filter, String searchType, String keyword);

	public void updateUser(User user);


	

}
