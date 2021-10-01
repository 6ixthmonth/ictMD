package com.sesoc.ictmd;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sesoc.ictmd.Interface.ModelDetailDAO;
import com.sesoc.ictmd.vo.ModelDetail;

/**
 * Handles requests for the application home page.
 */
@Controller 
public class AdminController {
	
	@Autowired SqlSession sqlsession;
	
	@RequestMapping(value = "/adminDetail", method = RequestMethod.GET)
	public String adminDetail(String modelName, Model model) {
		System.out.println(modelName);
		ModelDetailDAO dao = sqlsession.getMapper(ModelDetailDAO.class);
		ModelDetail detail = dao.selectInfo(modelName);
		System.out.println(detail);
		model.addAttribute("detail", detail);
		model.addAttribute("insert", "false");
		return "adminDetail";
	}
	
	@RequestMapping(value = "/adminModelInsertForm", method = RequestMethod.GET)
	public String adminModelInsertForm(Model model) {
		model.addAttribute("insert", "true");
		return "adminDetail";
	}
	
	@RequestMapping(value = "/updateModel", method = RequestMethod.GET)
	public String btnUpdateModel(ModelDetail detail, Model model) {
		System.out.println("update: " + detail);
		ModelDetailDAO dao = sqlsession.getMapper(ModelDetailDAO.class);
		int result = dao.updateDetail(detail);
		System.out.println(result);
		return "redirect:admin";
	}
	
	@RequestMapping(value = "/deleteModel", method = RequestMethod.GET)
	public String btnDeleteModel(String modelName, Model model) {
		System.out.println("delete: " + modelName);
		ModelDetailDAO dao = sqlsession.getMapper(ModelDetailDAO.class);
		int result = dao.deleteDetail(modelName);
		System.out.println(result);
		return "redirect:admin";
	}
	
	@RequestMapping(value = "/insertModel", method = RequestMethod.GET)
	public String btnInsertModel(ModelDetail detail, Model model) {
		System.out.println("insert: " + detail);
		ModelDetailDAO dao = sqlsession.getMapper(ModelDetailDAO.class);
		int result = dao.insertDetail(detail);
		System.out.println(result);
		return "redirect:admin";
	}
}