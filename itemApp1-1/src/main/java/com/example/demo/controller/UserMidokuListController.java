package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entity.UserMidokuList;
import com.example.demo.service.UserMidokuListService;

@Controller
public class UserMidokuListController {

	@Autowired
	UserMidokuListService userMidokuListService;

//  ユーザ一覧とユーザごとに既読した本のタイトルを一覧表示
    @RequestMapping(value = "/userMidokuList", method = RequestMethod.GET)
    public String userMidokuList(Model model) {
    	List<UserMidokuList> userMidokuList = userMidokuListService.userMidokuList();
    	model.addAttribute("userMidokuList", userMidokuList);
        return "userMidokuList";
    }
}
