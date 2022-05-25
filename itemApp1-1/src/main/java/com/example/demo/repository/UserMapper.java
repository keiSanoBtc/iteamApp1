package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.UserPlanBookEditRequest;
import com.example.demo.dto.UserPlanBookRequest;
import com.example.demo.dto.UserSearchRequest;
import com.example.demo.entity.Book;
import com.example.demo.entity.User;
import com.example.demo.entity.UserPlanBook;


@Mapper
public interface UserMapper {

	User userSearch(UserSearchRequest user);

    List<Book> userPlanBookList(UserSearchRequest user);

    List<Book> userPastBookList(UserSearchRequest user);

    UserPlanBook userPlanBookEdit(UserPlanBookRequest user);

    void userPlanBookEditComplete(UserPlanBookEditRequest user);

    void deletePlanBook(UserPlanBookRequest user);

    void postBook(UserPlanBookRequest user);

    List<User> userSearchedList();

}