package com.myboard.myapp.admin.dao.face;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.myboard.myapp.dto.Admin;
import com.myboard.myapp.util.Paging;

public interface AdminDao {

	public int cntAdminByIdPw(Admin admin);

	public int getCntReport(@Param("filter") String filter, @Param("keyword") String keyword);

	public List<Map<Object, String>> getRegulateList(@Param("paging") Paging paging, @Param("filter") String filter, @Param("keyword") String keyword);

	public void regulateComm(int commentNo);

	public void deleteReguComm(int commentNo);

}
