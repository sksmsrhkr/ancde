package com.myboard.myapp.admin.service.face;

import java.util.List;
import java.util.Map;

import com.myboard.myapp.dto.Admin;
import com.myboard.myapp.util.Paging;

public interface AdminService {

	public boolean getLogin(Admin admin);

	public Paging getCntRegulate(int curPage, String filter, String keyword);

	public List<Map<Object, String>> getRegulateList(Paging paging, String filter, String keyword);

	public void regulateComment(int commentNo);

	public void deleteRegulate(int commentNo);

	

}
