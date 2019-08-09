package com.example.demo.service;

import java.util.List;
import java.util.Map;

import com.example.demo.dto.Article;

public interface ArticleService {
	public List<Article> getList(Map<String, Object> args);

	public Article getOne(Map<String, Object> args);

	public long add(Map<String, Object> args);

	public void update(Map<String, Object> args);
	
	public void delete(int id);
	
	public void deleteReply(int id);
}