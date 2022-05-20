package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserSearchRequest;
import com.example.demo.entity.Book;



@Mapper
public interface UserMapper {

    List<Book> userPlanBookList(UserSearchRequest user);

    List<Book> userPastBookList(UserSearchRequest user);

    void deletePlanBook(UserSearchRequest user);

    void postBook(UserSearchRequest user);

}