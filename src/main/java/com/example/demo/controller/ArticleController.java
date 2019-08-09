package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.apache.groovy.util.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.Article;
import com.example.demo.service.ArticleService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class ArticleController {
	@Autowired
	private ArticleService articleService;

	@RequestMapping("article/list")
	public String showList(Model model, @RequestParam Map<String, Object> param) {
		param.put("extra__repliesCount", true);
		List<Article> list = articleService.getList(param);

		model.addAttribute("list", list);

		return "article/list";
	}

	@RequestMapping("article/detail")
	public String showDetail(@RequestParam(value = "id", defaultValue = "0") int id, Model model) {
		Article article = articleService.getOne(Maps.of("id", id));

		model.addAttribute("article", article);

		return "article/detail";
	}
	@RequestMapping("article/add")
	public String showAdd() {
		return "article/add";
	}
	
	@RequestMapping("article/doAdd")
	@ResponseBody
	public String doAddArticle(@RequestParam Map<String, Object> param) {
		Map<String, Object> newParam = param;
		
		newParam.put("memberId", 1);
		newParam.put("boardId", 1);
		
		long newId = articleService.add(newParam);
		
		StringBuilder sb = new StringBuilder();

		sb.append("<script>");

		sb.append("alert('" + newId + "번 게시물이 추가되었습니다.');");
		sb.append("location.replace('./detail?id=" + newId + "');");

		sb.append("</script>");

		return sb.toString();
	}
	
	@RequestMapping("article/modify")
	public String showModify(@RequestParam(value = "id", defaultValue = "0") int id, Model model) {
		Article article = articleService.getOne(Maps.of("id", id));

		model.addAttribute("article", article);
		
		return "article/modify";
	}
	
	@RequestMapping("/article/doModify")
	@ResponseBody
	public String doModify(@RequestParam Map<String, Object> param, int id) {
		Map<String, Object> newParam = param;
		
		newParam.put("memberId", 1);
		newParam.put("boardId", 1);
		
		articleService.update(param);
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("<script>");
		
		String msg = id + "번 게시물이 수정되었습니다.";
		sb.append("alert('" + msg + "');");
		
		String redirectUrl = "./detail?id=" + id;
		sb.append("location.replace('" + redirectUrl + "');");
		
		sb.append("</script>");

		return sb.toString();
	}
	
	@RequestMapping("article/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		
		articleService.delete(id);
		articleService.deleteReply(id);
		
		StringBuilder sb = new StringBuilder();
		
		sb.append("<script>");
		
		String msg = id + "번 게시물이 삭제되었습니다.";
		sb.append("alert('" + msg + "');");
		
		String redirectUrl = "./list";
		sb.append("location.replace('" + redirectUrl + "');");
		
		sb.append("</script>");

		return sb.toString();
	}
}