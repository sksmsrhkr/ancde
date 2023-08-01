package com.myboard.myapp.service.dao.face;

import com.myboard.myapp.dto.Inquiry;

public interface ServiceDao {

	public void insertInquiry(Inquiry inquiry);

	public Inquiry getQnaView(int inquiryNo);

	public void insertAnswer(Inquiry inquiry);

	public void deleteAnswer(int inquiryNo);

}
