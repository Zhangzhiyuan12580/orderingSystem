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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.orderingSystem.model.FoodClass;
import com.orderingSystem.model.FoodInfo;
import com.orderingSystem.model.User;
import com.orderingSystem.service.IFoodClassService;
import com.orderingSystem.service.IFoodInfoService;
import com.orderingSystem.service.IUserService;
import com.orderingSystem.util.Page;

@Controller
@RequestMapping("userManagement")
public class UserController {

	private static final String HOME_PAGE = "index01";
	@Resource
	private IUserService userService;
	@Resource
	private IFoodInfoService foodInfoService;
	@Resource
	private IFoodClassService foodClassService;
	/**
	 * 注册
	 * @param user
	 * @return
	 */
	@RequestMapping("/register")
	public ModelAndView register(User user) {
		
		ModelAndView mav = new ModelAndView();
		String msg = "注册成功";
		List<User> list = userService.findAll();
		if(!list.isEmpty()) {
			for(User u: list) {
				if(u.getUsername().equals(user.getUsername())) {
					msg = "用户名已经存在";
					mav.setViewName("login");
					mav.addObject("msg", msg);
					return mav;
				}
			}
		}
		user.setId(UUID.randomUUID().toString());
		user.setCreateTime(new Date());
		user.setIsAdmin("0");
		userService.save(user);
		mav.addObject("msg", msg);
		mav.setViewName("login");
		return mav;
	}
	/**
	 * 登陆
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
		
		ModelAndView mav = new ModelAndView();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		String msg = "登陆成功";
		List<User> list = userService.findAll();
		if(list.isEmpty()) {
			msg = "用户名不存在";
			mav.setViewName("login");
			mav.addObject("msg", msg);
			return mav;
		}
		for(User u : list) {
			if(u.getUsername().equals(username) 
					&& u.getPassword().equals(password)) {
				mav.setViewName(HOME_PAGE);
				mav.addObject("msg", msg);
				mav.addObject("user", u);
				List<FoodClass> list1 = foodClassService.findAll();
				List<FoodInfo> list2 = foodInfoService.findAll();
				mav.addObject("foodClassList", list1);
				mav.addObject("foodInfoList", list2);
				return mav;
			} 
		}
		
		msg = "用户名或者密码错误";
		mav.setViewName("login");
		mav.addObject("msg", msg);
		return mav;
	}
	@RequestMapping("/pageList")
	public String pageList(User user, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		String pageNum = request.getParameter("pageNum1");
		Page<User> page1 = new Page<User>();
		if(!StringUtils.isEmpty(pageNum)) {
			page1.setPageNum(Integer.parseInt(pageNum));
		}
		page1.getList().add(user);
		Page<User> page = userService.findBySearchFilter(page1);
		List<User> userList = page.getList();
		model.addAttribute("userList", userList);
		model.addAttribute("pageCount", page.getPageCount());
		model.addAttribute("count", page.getCount());
		model.addAttribute("page", page);
		String flag = request.getParameter("flag");
		String msg = "";
		if("save1".equals(flag)) {//保存成功
			msg = "保存成功";
			model.addAttribute("msg", msg);
		}else if("save0".equals(flag)) {//保存失败
			msg = "用户名重复，保存失败";
			model.addAttribute("msg", msg);
		}else if("delete1".equals(flag)) {
			msg = "删除成功";
			model.addAttribute("msg", msg);
		}else if("delete0".equals(flag)) {
			msg = "删除成功";
			model.addAttribute("msg", msg);
		}
		
		return "YHGL";
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
			userService.delete(userService.findById(id));
			return new ModelAndView("redirect:/userManagement/pageList.do?flag=delete1");
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/userManagement/pageList.do?flag=delete0");
		}	
	}
	
	/**
	 * 根据ID获取数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/findById")
	@ResponseBody
	public User findById(HttpServletRequest request) {
		String id = request.getParameter("id");
		User user = userService.findById(id);
		if(user == null) {
			user = new User();
		}
		
		return user;
	}
	/**
	 * 保存数据，用户名验重
	 */
	@RequestMapping("/save")
	public ModelAndView save(User user,Model model) {
		
		/*List<User> list = userService.findAll();
		if(!list.isEmpty()) {
			for(User u: list) {
				if(u.getUsername().equals(user.getUsername())) {
					return new ModelAndView("redirect:/userManagement/pageList.do?flag=save0");
				}
			}
		}*/
		user.setId(UUID.randomUUID().toString());
		user.setCreateTime(new Date());
		userService.save(user);
		return new ModelAndView("redirect:/userManagement/pageList.do?flag=save1");
	}
	/**
	 * 修改数据，用户名验重
	 */
	@RequestMapping("/update")
	public ModelAndView update(User user, HttpServletRequest request){
		/*List<User> list = userService.findAll();
		if(!list.isEmpty()) {
			for(User u: list) {
				if(u.getUsername().equals(user.getUsername())
						&& !u.getId().equals(user.getId())) {
					return new ModelAndView("redirect:/userManagement/pageList.do?flag=save0");
				}
			}
		}*/
		User u = userService.findById(user.getId());
		u.setUsername(user.getUsername());
		u.setAddress(user.getAddress());
		u.setEmail(user.getEmail());
		u.setPhone(user.getPhone());
		u.setPassword(user.getPassword());
		userService.update(u);
		//重定向到你的findAlluser方法

		return new ModelAndView("redirect:/userManagement/pageList.do?flag=save1");
	}
	
	@RequestMapping("/checkForm")
	@ResponseBody
	public boolean checkForm (HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String username = request.getParameter("username");
		
		List<User> list = userService.findAll();
		if(!list.isEmpty()) {
			for(User u: list) {
				if(u.getUsername().equals(username)
						&& !u.getId().equals(id)) {
					return false;
				}
			}
		}
		return true;
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public boolean check(HttpServletRequest request) {
		
		String username = request.getParameter("username");
		List<User> list = userService.findAll();
		
		if(!list.isEmpty()) {
			for (User user : list) {
				if(user.getUsername().equals(username)) {
					return false;
				}
			}
		}
		
		return true;
	}
	
}
