package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entity.UserList;
import com.example.demo.service.UserListService;

@Controller
public class UserListController {

	@Autowired
	UserListService userListService;

//  ユーザ一覧を表示
    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public String userList(Model model) {
    	List<UserList> userList = userListService.userList();
    	model.addAttribute("userList", userList);
        return "userList";
    }

}
