package com.myboard.myapp.service.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.myapp.dto.Inquiry;
import com.myboard.myapp.service.dao.face.ServiceDao;
import com.myboard.myapp.service.service.face.ServiceService;

@Service
public class ServiceServiceImpl implements ServiceService {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired ServiceDao serviceDao;
	
	@Override
	public void insertInqu(Inquiry inquiry) {
		serviceDao.insertInquiry(inquiry);
	}

	@Override
	public Inquiry getInquiryView(int inquiryNo) {
		return serviceDao.getQnaView(inquiryNo);
	}

	@Override
	public void insertAnswer(Inquiry inquiry) {
		serviceDao.insertAnswer(inquiry);
	}

	@Override
	public void deleteAnswer(int inquiryNo) {
		serviceDao.deleteAnswer(inquiryNo);
	}

}
