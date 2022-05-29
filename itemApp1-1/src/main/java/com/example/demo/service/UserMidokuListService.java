package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.UserMidokuList;
import com.example.demo.repository.UserMidokuListMapper;

@Service
public class UserMidokuListService {

	@Autowired
    private UserMidokuListMapper userMidokuListMapper;

    public List<UserMidokuList> userMidokuList() {

    	return userMidokuListMapper.userMidokuList();

    }

}
