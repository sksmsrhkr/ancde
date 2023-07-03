package com.myboard.myapp.Board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	 private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("/list")
	public void BoardList() {
		
		logger.info("굿굿");
		
	}
	
	
	

}
