package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.UserKidokuList;
import com.example.demo.repository.UserKidokuListMapper;

@Service
public class UserKidokuListService {

	@Autowired
    private UserKidokuListMapper userKidokuListMapper;

    public List<UserKidokuList> userKidokuList() {

    	return userKidokuListMapper.userKidokuList();

    }

}
