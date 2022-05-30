package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entity.UserKidokuList;
import com.example.demo.service.UserKidokuListService;

@Controller
public class UserKidokuListController {

	@Autowired
	UserKidokuListService userKidokuListService;

//  ユーザ一覧とユーザごとに既読した本のタイトルを一覧表示
    @RequestMapping(value = "/userKidokuList", method = RequestMethod.GET)
    public String userKidokuList(Model model) {
    	List<UserKidokuList> userKidokuList = userKidokuListService.userKidokuList();
    	model.addAttribute("userKidokuList", userKidokuList);
        return "userKidokuList";
    }
}
