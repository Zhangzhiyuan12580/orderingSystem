package com.orderingSystem.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.orderingSystem.model.OrderDetailInfo;
import com.orderingSystem.model.OrderInfo;
import com.orderingSystem.model.User;
import com.orderingSystem.service.IOrderDetailInfoService;
import com.orderingSystem.service.IOrderInfoService;
import com.orderingSystem.service.IUserService;
import com.orderingSystem.util.Page;

@Controller
@RequestMapping("orderInfo")
public class OrderInfoController {

	@Resource
	private IOrderInfoService orderInfoService;
	@Resource
	private IUserService userService;
	@Resource
	private IOrderDetailInfoService orderDetailInfoService;
	
	@RequestMapping("/save")
	public ModelAndView save(HttpServletRequest request, Model model) {
		
		String userId = request.getParameter("userId");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String price = request.getParameter("price");
		
		User user = userService.findById(userId);
		String orderNo = user.getUsername() + phone;
		
		OrderInfo orderInfo = new OrderInfo();
		orderInfo.setAddress(address);
		orderInfo.setCreateTime(new Date());
		orderInfo.setId(UUID.randomUUID().toString());
		orderInfo.setIsDeal("0");
		orderInfo.setPhone(phone);
		orderInfo.setTotalPrice(price);
		orderInfo.setOrderNo(orderNo);
		orderInfo.setUser(user);
		orderInfoService.save(orderInfo);
		List<OrderDetailInfo> list = orderDetailInfoService.findShoppingCart(userId);
		if(!list.isEmpty()) {
			for (OrderDetailInfo orderDetailInfo : list) {
				orderDetailInfo.setOrderInfo(orderInfo);
				orderDetailInfoService.update(orderDetailInfo);
			}
		}
		return new ModelAndView("redirect:/orderInfo/findOrderInfoByUser.do?userId=" + userId);
	}
	
	@RequestMapping("/pageList")
	public String pageList(OrderInfo orderInfo, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		model.addAttribute("isDeal", orderInfo.getIsDeal());
		String pageNum = request.getParameter("pageNum1");
		Page<OrderInfo> page1 = new Page<OrderInfo>();
		if(!StringUtils.isEmpty(pageNum)) {
			page1.setPageNum(Integer.parseInt(pageNum));
		}
		page1.getList().add(orderInfo);
		Page<OrderInfo> page = orderInfoService.findBySearchFilter(page1);
		List<OrderInfo> orderInfoList = page.getList();
		for (OrderInfo o : orderInfoList) {
			if(o.getIsDeal().equals("0")) {
				o.setIsDeal("未处理");
			} else if(o.getIsDeal().equals("1")) {
				o.setIsDeal("已处理");
			} else {
				o.setIsDeal("已完成");
			}
		}
		model.addAttribute("orderInfoList", orderInfoList);
		model.addAttribute("pageCount", page.getPageCount());
		model.addAttribute("count", page.getCount());
		model.addAttribute("page", page);
		String flag = request.getParameter("flag");
		String msg = "";
		if("delete1".equals(flag)) {
			msg = "删除成功";
			model.addAttribute("msg", msg);
		}else if("delete0".equals(flag)) {
			msg = "有级联关系,删除失败";
			model.addAttribute("msg", msg);
		} else if("deal".equals(flag)) {
			msg = "订单已经处理";
			model.addAttribute("msg", msg);
		}
		return "DDGL";
	}
	
	/**
	 * 根据ID删除数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")
	public ModelAndView delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		try {
			orderInfoService.delete(orderInfoService.findById(id));
			return new ModelAndView("redirect:/orderInfo/pageList.do?flag=delete1");
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/orderInfo/pageList.do?flag=delete0");
		}	
	}
	
	@RequestMapping("/dealOrderInfo")
	public ModelAndView dealOrderInfo(HttpServletRequest request) {
		String id = request.getParameter("id");
		OrderInfo orderInfo = orderInfoService.findById(id);
		orderInfo.setIsDeal("1");
		orderInfoService.update(orderInfo);
		return new ModelAndView("redirect:/orderInfo/pageList.do?flag=deal");
	}
	
	@RequestMapping("/dealOrderInfo2")
	public ModelAndView dealOrderInfo2(HttpServletRequest request) {
		String userId = request.getParameter("userId");
		String id = request.getParameter("id");
		OrderInfo orderInfo = orderInfoService.findById(id);
		if(orderInfo.getIsDeal().equals("0")) {
			return new ModelAndView("redirect:/orderInfo/findOrderInfoByUser.do?userId=" + userId + "&flag=dealFalse");
		} else {
			orderInfo.setIsDeal("2");
			orderInfoService.update(orderInfo);
			return new ModelAndView("redirect:/orderInfo/findOrderInfoByUser.do?userId=" + userId + "&flag=deal");
		}
		
	}
	
	@RequestMapping("/findOrderInfoByUser")
	public String findOrderInfoByUser(OrderInfo orderInfo, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		model.addAttribute("isDeal", orderInfo.getIsDeal());
		String userId = request.getParameter("userId");
		User user = userService.findById(userId);
		orderInfo.setUser(user);
		String pageNum = request.getParameter("pageNum1");
		Page<OrderInfo> page1 = new Page<OrderInfo>();
		if(!StringUtils.isEmpty(pageNum)) {
			page1.setPageNum(Integer.parseInt(pageNum));
		}
		page1.getList().add(orderInfo);
		Page<OrderInfo> page = orderInfoService.findBySearchFilter(page1);
		List<OrderInfo> orderInfoList = page.getList();
		for (OrderInfo o : orderInfoList) {
			if(o.getIsDeal().equals("0")) {
				o.setIsDeal("未接单");
			} else if(o.getIsDeal().equals("1")) {
				o.setIsDeal("配送中");
			} else {
				o.setIsDeal("已完成");
			}
		}
		model.addAttribute("orderInfoList", orderInfoList);
		model.addAttribute("page", page);
		model.addAttribute("user", user);
		String flag = request.getParameter("flag");
		String msg = "";
		if(flag != null && flag != "") {
			if(flag.equals("deal")) {
				msg = "已经确认收货";
				model.addAttribute("msg", msg);
			} else if(flag.equals("cancle")) {
				msg = "已经接单无法取消";
				model.addAttribute("msg", msg);
			} else if(flag.equals("delete")) {
				msg = "取消成功";
				model.addAttribute("msg", msg);
			} else if(flag.equals("dealFalse")) {
				msg = "商家未接单，无法确认收货";
				model.addAttribute("msg", msg);
			}
		}
		return "LSDD";
	}
	
	@RequestMapping("/cancleOrderInfo")
	public ModelAndView cancleOrderInfo(HttpServletRequest request, Model model) {
		String userId = request.getParameter("userId");
		String id = request.getParameter("id");
		
		OrderInfo orderInfo = orderInfoService.findById(id);
		if(orderInfo.getIsDeal().equals("0")) {
			//可以删除
			List<OrderDetailInfo> list = orderDetailInfoService.findAll();
			for (OrderDetailInfo orderDetailInfo : list) {
				 if(orderDetailInfo.getOrderInfo().getId().equals(id)) {
					 orderDetailInfoService.delete(orderDetailInfo);
				 }
			}
			orderInfoService.delete(orderInfo);
			return new ModelAndView("redirect:/orderInfo/findOrderInfoByUser.do?userId=" + userId + "&flag=delete");
		} else {
			return new ModelAndView("redirect:/orderInfo/findOrderInfoByUser.do?userId=" + userId + "&flag=cancle");
		}
	}
}
