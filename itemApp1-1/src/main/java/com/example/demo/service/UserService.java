package com.example.demo.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.UserPlanBookEditRequest;
import com.example.demo.dto.UserPlanBookRequest;
import com.example.demo.dto.UserSearchRequest;
import com.example.demo.entity.Book;
import com.example.demo.entity.User;
import com.example.demo.entity.UserPlanBook;
import com.example.demo.repository.UserMapper;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User userSearch(UserSearchRequest userSearchRequest) {
        return userMapper.userSearch(userSearchRequest);
    }

    public List<Book> userPlanBookList(UserSearchRequest userSearchRequest) {
        return userMapper.userPlanBookList(userSearchRequest);
    }

    public List<Book> userPastBookList(UserSearchRequest userSearchRequest) {
        return userMapper.userPastBookList(userSearchRequest);
    }

    public UserPlanBook userPlanBookEdit(UserPlanBookRequest userPlanBookRequest) {
        return userMapper.userPlanBookEdit(userPlanBookRequest);
    }

    public void userPlanBookEditComplete(UserPlanBookEditRequest userPlanBookEditRequest) {
        userMapper.userPlanBookEditComplete(userPlanBookEditRequest);
    }

    public void deletePlanBook(UserPlanBookRequest userPlanBookRequest) {
        userMapper.deletePlanBook(userPlanBookRequest);
    }

    public void postBook(UserPlanBookRequest userPlanBookRequest) {
        userMapper.postBook(userPlanBookRequest);
    }
}
