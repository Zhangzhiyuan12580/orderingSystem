package com.orderingSystem.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.orderingSystem.model.OrderInfo;
import com.orderingSystem.service.IOrderInfoService;
import com.orderingSystem.util.MP3Player;

@Controller
@RequestMapping("myTimer")
public class MyTimer {

	private static final long timeInterval = 5000;

	@Resource
	private IOrderInfoService orderInfoService;

	@RequestMapping("/startTimer")
	public String startTimer() {
	
		Runnable runnable = new Runnable() {
			
			public void run() {
				
				while(true) {
					//任务
					List<OrderInfo> orderInfo = orderInfoService.findAll();
					for (OrderInfo index : orderInfo) {
						if(index.getIsDeal().equals("0")) {
							MP3Player mp3 = new MP3Player("D:/workspaces/orderingSystem/src/main/webapp/mp3/msg.mp3");
							mp3.play();
							break;
						}
					}
					try {
						Thread.sleep(timeInterval);
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
				} 
			}
		};
		Thread thread = new Thread(runnable);
		thread.start();
		return "homePage";
	}
	
}
