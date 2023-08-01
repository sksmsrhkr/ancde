package com.myboard.myapp.service.service.face;

import com.myboard.myapp.dto.Inquiry;

public interface ServiceService {

	public void insertInqu(Inquiry inquiry);

	public Inquiry getInquiryView(int inquiryNo);

	public void insertAnswer(Inquiry inquiry);

	public void deleteAnswer(int inquiryNo);

}
