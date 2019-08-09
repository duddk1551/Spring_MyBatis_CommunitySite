package com.example.demo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.Article;

@Mapper
public interface ArticleDao {
	public List<Article> getList(Map<String, Object> args);

	public Article getOne(Map<String, Object> args);

	public void add(Map<String, Object> args);

	public void update(Map<String, Object> args);
	
	public void delete(int id);
	
	public void deleteReply(int id);
}