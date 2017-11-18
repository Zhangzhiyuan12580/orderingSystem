package com.orderingSystem.controller;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.orderingSystem.model.FoodClass;
import com.orderingSystem.model.FoodInfo;
import com.orderingSystem.service.IFoodClassService;
import com.orderingSystem.service.IFoodInfoService;
import com.orderingSystem.util.Page;

@Controller
@RequestMapping("foodClass")
public class FoodClassController {

	@Resource
	private IFoodClassService foodClassService;
	@Resource
	private IFoodInfoService foodInfoService;
	
	/**
	 * 分页查询
	 * @param foodClass
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/pageList")
	public String pageList(FoodClass foodClass, HttpServletRequest request, Model model) {
		
		String pageNum = request.getParameter("pageNumber");
		Page<FoodClass> searchPage = new Page<FoodClass>();
		if(!StringUtils.isEmpty(pageNum)) {
			searchPage.setPageNum(Integer.parseInt(pageNum));
		}
		searchPage.getList().add(foodClass);
		Page<FoodClass> page = foodClassService.findBySearchFilter(searchPage);
		model.addAttribute("foodClassList", page.getList());
		model.addAttribute("page", page);
		
		String flag = request.getParameter("flag");
		String msg = "";
		if("save".equals(flag)) {
			msg = "保存成功";
			model.addAttribute("msg", msg);
		}
		if("delete1".equals(flag)) {
			msg = "删除成功";
			model.addAttribute("msg", msg);
		}
		if("delete0".equals(flag)) {
			msg = "删除失败，有级联关系！";
			model.addAttribute("msg", msg);
		}
		return "foodClass";
	}
	
	/**
	 * 根据ID获取数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/findById")
	@ResponseBody
	public FoodClass findById(HttpServletRequest request) {
		String id = request.getParameter("id");
		FoodClass foodClass = foodClassService.findById(id);
		if(foodClass == null) {
			return new FoodClass();
		}
		
		return foodClass;
	}
	
	/**
	 * 保存数据
	 * @param foodClass
	 * @return
	 */
	@RequestMapping("/save")
	public ModelAndView save(FoodClass foodClass) {
		foodClass.setId(UUID.randomUUID().toString());
		foodClass.setCreateTime(new Date());
		foodClassService.save(foodClass);
		return new ModelAndView("redirect:/foodClass/pageList.do?flag=save");
	}
	
	/**
	 * 修改数据
	 * @param foodClass
	 * @return
	 */
	@RequestMapping("/update")
	public ModelAndView update(FoodClass foodClass) {
		
		FoodClass newFoodClass = foodClassService.findById(foodClass.getId());
		newFoodClass.setClassName(foodClass.getClassName());
		newFoodClass.setClassInformation(foodClass.getClassInformation());
		foodClassService.update(newFoodClass);
		
		return new ModelAndView("redirect:/foodClass/pageList.do?flag=save");
	}
	
	@RequestMapping("/checkForm")
	@ResponseBody
	public boolean checkForm (HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		String className = request.getParameter("className");
		
		List<FoodClass> list = foodClassService.findAll();
		if(!list.isEmpty()) {
			for(FoodClass u: list) {
				if(u.getClassName().equals(className)
						&& !u.getId().equals(id)) {
					return false;
				}
			}
		}
		return true;
	}
	
	/**
	 * 根据ID删除数据 判断是否有级联关系
	 * @param request
	 * @return
	 */
	@RequestMapping("/delete")
	public ModelAndView delete(HttpServletRequest request) {
		String id = request.getParameter("id");
		List<FoodInfo> list = foodInfoService.findAll();
		for(FoodInfo foodInfo : list) {
			if(foodInfo.getFoodClass().getId().equals(id)) {
				return new ModelAndView("redirect:/foodClass/pageList.do?flag=delete0");
			}
		}
		foodClassService.delete(foodClassService.findById(id));
		return new ModelAndView("redirect:/foodClass/pageList.do?flag=delete1");
	}
}
