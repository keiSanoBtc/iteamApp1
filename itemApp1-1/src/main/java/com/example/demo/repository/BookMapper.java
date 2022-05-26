package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.BookUserEditRequest;
import com.example.demo.dto.UserSearchRequest;
import com.example.demo.entity.Book;
import com.example.demo.entity.User;

@Mapper
public interface BookMapper {

	List<Book> bookSearchedList(UserSearchRequest user);

	void addPlanBook(BookUserEditRequest user);

	Book lastPlanBookNum();

	User userSearch(BookUserEditRequest bookUserEditRequest);

}
