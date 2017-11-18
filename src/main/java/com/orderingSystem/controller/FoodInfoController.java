package com.orderingSystem.controller;

import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.orderingSystem.model.FoodClass;
import com.orderingSystem.model.FoodInfo;
import com.orderingSystem.service.IFoodClassService;
import com.orderingSystem.service.IFoodInfoService;
import com.orderingSystem.util.Page;

@Controller
@RequestMapping("foodInfo")
public class FoodInfoController {

	@Resource
	private IFoodInfoService foodInfoService;
	@Resource
	private IFoodClassService foodClassService;
	
	/**
	 * 分页查询
	 * @param foodInfo
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/pageList")
	public String pageList( FoodInfo foodInfo, HttpServletRequest request, Model model) {
		
		String pageNum = request.getParameter("pageNumber");
		Page<FoodInfo> searchPage = new Page<FoodInfo>();
		if(!StringUtils.isEmpty(pageNum)) {
			searchPage.setPageNum(Integer.parseInt(pageNum));
		}
		
		String classId = request.getParameter("classId");
		if(!StringUtils.isEmpty(classId)) {
			foodInfo.setFoodClass(foodClassService.findById(classId));
		}
		searchPage.getList().add(foodInfo);
		
		Page<FoodInfo> page = foodInfoService.findBySearchFilter(searchPage);
		model.addAttribute("foodInfoList", page.getList());
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
		
		return "foodInfo";
	}
	
	/**
	 * 保存数据
	 * @param foodClass
	 * @return
	 */
	@RequestMapping("/save")
	public ModelAndView save(FoodInfo foodInfo, HttpServletRequest request) throws Exception{
		
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest)request;
		MultipartFile file = mreq.getFile("photo");
		String fileName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("/")+ "upload/" + fileName;
		String photoPath = "upload/" + fileName;
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(file.getBytes());
		fos.flush();
		fos.close();
		String foodClassId = request.getParameter("foodClassId");
		FoodClass foodClass = foodClassService.findById(foodClassId);
		foodInfo.setPhotoPath(photoPath);
		foodInfo.setFoodClass(foodClass);
		foodInfo.setId(UUID.randomUUID().toString());
		foodInfo.setCreateTime(new Date());
		foodInfoService.save(foodInfo);
		return new ModelAndView("redirect:/foodInfo/pageList.do?flag=save");
	}
	
	/**
	 * 修改数据
	 * @param foodClass
	 * @return
	 */
	@RequestMapping("/update")
	public ModelAndView update(FoodInfo foodInfo, HttpServletRequest request) throws Exception{
		
		MultipartHttpServletRequest mreq = (MultipartHttpServletRequest)request;
		MultipartFile file = mreq.getFile("photo");
		String fileName = file.getOriginalFilename();
		String path = request.getSession().getServletContext().getRealPath("/")+ "upload/" + fileName;
		String photoPath = "upload/" + fileName;
		FileOutputStream fos = new FileOutputStream(path);
		fos.write(file.getBytes());
		fos.flush();
		fos.close();
		String foodClassId = request.getParameter("foodClassId");
		FoodClass foodClass = foodClassService.findById(foodClassId);
		FoodInfo newFoodInfo = foodInfoService.findById(foodInfo.getId());
		newFoodInfo.setFoodClass(foodClass);
		newFoodInfo.setInformation(foodInfo.getInformation());
		newFoodInfo.setName(foodInfo.getName());
		newFoodInfo.setPhotoPath(photoPath);
		newFoodInfo.setPrice(foodInfo.getPrice());
		foodInfoService.update(newFoodInfo);
		
		return new ModelAndView("redirect:/foodInfo/pageList.do?flag=save");
	}
	/**
	 * 根据ID获取数据
	 * @param request
	 * @return
	 */
	@RequestMapping("/findById")
	@ResponseBody
	public FoodInfo findById(HttpServletRequest request) {
		String id = request.getParameter("id");
		FoodInfo foodInfo = foodInfoService.findById(id);
		if(foodInfo == null) {
			return new FoodInfo();
		}
		
		return foodInfo;
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
			foodInfoService.delete(foodInfoService.findById(id));
			return new ModelAndView("redirect:/foodInfo/pageList.do?flag=delete1");
		} catch (Exception e) {
			e.printStackTrace();
			return new ModelAndView("redirect:/foodInfo/pageList.do?flag=delete0");
		}	
	}
	/**
	 * 查询所有菜品种类
	 * @return
	 */
	@RequestMapping("/findAllFoodClass")
	@ResponseBody
	public List<FoodClass> findAllFoodClass() {
		List<FoodClass> list = foodClassService.findAll();
		return list;
	}
	/**
	 * 表单验证
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/checkForm")
	@ResponseBody
	public boolean checkForm (HttpServletRequest request, Model model) {
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		List<FoodInfo> list = foodInfoService.findAll();
		if(!list.isEmpty()) {
			for(FoodInfo u: list) {
				if(u.getName().equals(name)
						&& !u.getId().equals(id)) {
					return false;
				}
			}
		}
		return true;
	}
	/**
	 * 查询所有菜品信息和所有菜品种类信息
	 * @param model
	 * @return
	 */
	@RequestMapping("/findAllFoodInfo")
	public String findAllFoodInfo(Model model) {
		List<FoodClass> list = foodClassService.findAll();
		List<FoodInfo> list2 = foodInfoService.findAll();
		model.addAttribute("foodClassList", list);
		model.addAttribute("foodInfoList", list2);
		return "index01";
	}
	
	/**
	 * 根据菜品种类查询菜品信息
	 * @param foodClassId
	 * @param model
	 * @return
	 */
	@RequestMapping("/findFoodInfoBySearchFilter")
	@ResponseBody
	public List<FoodInfo> findFoodInfoBySearchFilter(@RequestParam String foodClassId, Model model) {
		List<FoodInfo> list = foodInfoService.findByFoodClassId(foodClassId);
		return list;
	}
	
	/**
	 * 查询所有食物信息
	 * @return
	 */
	@RequestMapping("/findAll")
	@ResponseBody
	public List<FoodInfo> findFoodInfo() {
		List<FoodInfo> list = foodInfoService.findAll();
		return list;
	}
	
}
