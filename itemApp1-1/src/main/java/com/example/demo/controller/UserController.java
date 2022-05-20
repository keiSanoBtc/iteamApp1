package com.example.demo.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String userPlanBookList(@ModelAttribute UserSearchRequest userSearchRequest, Model model) {
    	List<Book> userPlanBookList = userService.userPlanBookList(userSearchRequest);
        model.addAttribute("planBookList", userPlanBookList);
        return "user";
    }
}