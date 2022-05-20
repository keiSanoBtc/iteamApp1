package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	//ユーザ情報 Service

	@Autowired
	private UserMapper userMapper;



	public User search(UserSearchRequest userSearchRequest) {
		return userMapper.search(userSearchRequest);
	}


}
