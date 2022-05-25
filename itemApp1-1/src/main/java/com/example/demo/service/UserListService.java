package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.UserList;
import com.example.demo.repository.UserListMapper;

@Service
public class UserListService {

	@Autowired
    private UserListMapper userListMapper;

    public List<UserList> userList() {

    	return userListMapper.userList();

    }

}
