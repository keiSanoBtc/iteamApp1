package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.dto.UserSearchRequest;
import com.example.demo.entity.Book;
import com.example.demo.entity.User;
import com.example.demo.service.UserService;


@Controller
public class UserController {

	@Autowired
	UserService userService;

//	読みたい本リストと
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String userPlanBookList(@ModelAttribute UserSearchRequest userSearchRequest, Model model){
    	List<Book> userPlanBookList = userService.userPlanBookList(userSearchRequest);
//    	読んだ本リスト
        model.addAttribute("userPlanBookList", userPlanBookList);
//        アトリビュート２
        return "user";
    }

//  読みたい本の削除
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deletePlanBook(@ModelAttribute UserSearchRequest userSearchRequest, Model model) {
    	userService.deletePlanBook(userSearchRequest);
        model.addAttribute("message", "deleteしました。");
        return "deleted_confirm";
    }

//  読みたい本を既読する
    @RequestMapping(value = "/postbook", method = RequestMethod.POST)
    public String postBook(@ModelAttribute UserSearchRequest userSearchRequest, Model model) {
    	userService.postBook(userSearchRequest);
        model.addAttribute("message", "deleteしました。");
        return "postbook_confirm";
    }

    @RequestMapping(value = "/userlist", method = RequestMethod.GET)
    public String userList(Model model) {
    	List<User> userList = new ArrayList<User>();
    	User user1 = new User();
    	User user2 = new User();
    	user1.name = "佐野";
    	user2.name = "大井";
    	userList.add(user1);
    	userList.add(user2);
    	model.addAttribute("userList", userList);
        return "userList";
    }
}