package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.dto.UserPlanBookEditRequest;
import com.example.demo.dto.UserPlanBookRequest;
import com.example.demo.dto.UserSearchRequest;
import com.example.demo.entity.Book;
import com.example.demo.entity.User;
import com.example.demo.entity.UserPlanBook;
import com.example.demo.service.UserService;


@Controller
public class UserController {

	@Autowired
	UserService userService;

//	 最初の画面
	 @RequestMapping(value = "/index", method = RequestMethod.GET)
	 public String index(Model model) {
		 return "index";
	 }
	 @RequestMapping(value="/userSearch", method=RequestMethod.GET)
	 public String userSearch(Model model) {
		 model.addAttribute("userSearchRequest", new UserSearchRequest());
		 return "userSearch";
	 }

//	 利用者ごとのページを表示
	 @RequestMapping(value = "/user", method = RequestMethod.POST)
	 public String userSearch(@Validated @ModelAttribute UserSearchRequest userSearchRequest, BindingResult result, Model model){

		 if (result.hasErrors()) {
			  List<String> errorList = new ArrayList<String>();
	          for (ObjectError error : result.getAllErrors()) {
	        	  errorList.add(error.getDefaultMessage());
	          }
	          model.addAttribute("validationError", errorList);
	          return "userSearch";
	     }

		 User user = userService.userSearch(userSearchRequest);

		 if (user == null) {
			 List<String> errorList = new ArrayList<String>();
			 errorList.add("ユーザーが登録されていません");
			 model.addAttribute("validationError", errorList);
			 return "userSearch";
		 }

		 List<Book> userPlanBookList = userService.userPlanBookList(userSearchRequest);
		 List<Book> userPastBookList = userService.userPastBookList(userSearchRequest);
		 model.addAttribute("user", user);
		 model.addAttribute("userPastBookList", userPastBookList);
		 model.addAttribute("userPlanBookList", userPlanBookList);
	     return "user";
	 }

//  読みたい本の編集
	 @RequestMapping(value = "/edit", method = RequestMethod.POST)
	 public String editPlanBook(@ModelAttribute UserPlanBookRequest userPlanBookRequest, Model model) {
		 UserPlanBook userPlanBook = userService.userPlanBookEdit(userPlanBookRequest);
		 User user = userService.userDeleteSearch(userPlanBookRequest);
		 model.addAttribute("userPlanBook", userPlanBook);
		 model.addAttribute("user", user);
		 return "edit";
	    }


//  読みたい本の編集完了
	@RequestMapping(value = "/editComplete", method = RequestMethod.POST)
	 public String editPlanBookComplete(@Validated @ModelAttribute UserPlanBookEditRequest userPlanBookEditRequest, BindingResult result, Model model) {

		if (result.hasErrors()) {
			  List<String> errorList = new ArrayList<String>();
	          for (ObjectError error : result.getAllErrors()) {
	        	  errorList.add(error.getDefaultMessage());
	          }
	          User user = userService.userEditSearch(userPlanBookEditRequest);
	          UserPlanBook userPlanBook = userService.userPlanBookSearch(userPlanBookEditRequest);
	          model.addAttribute("user", user);
	          model.addAttribute("userPlanBook", userPlanBook);
	          model.addAttribute("validationError", errorList);
	          return "edit";
	     }

		User user = userService.userEditSearch(userPlanBookEditRequest);
		userService.userPlanBookEditComplete(userPlanBookEditRequest);
		model.addAttribute("user", user);
		return "editComplete";
	}


//  読みたい本の削除
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deletePlanBook(@ModelAttribute UserPlanBookRequest userPlanBookRequest, Model model) {
    	User user = userService.userDeleteSearch(userPlanBookRequest);
    	userService.deletePlanBook(userPlanBookRequest);
        model.addAttribute("deleteMessage", "削除しました。");
        model.addAttribute("user", user);
        return "deleteComplete";
    }

//  読みたい本を既読する
    @RequestMapping(value = "/kidokuComplete", method = RequestMethod.POST)
    public String postBook(@ModelAttribute UserPlanBookRequest userPlanBookRequest, Model model) {
    	User user = userService.userDeleteSearch(userPlanBookRequest);
    	userService.postBook(userPlanBookRequest);
        model.addAttribute("message", "既読しました。");
        model.addAttribute("user", user);
        return "kidokuComplete";
    }

//  既読の本を未読にする
    @RequestMapping(value = "/midokuComplete", method = RequestMethod.POST)
    public String midokuBook(@ModelAttribute UserPlanBookRequest userPlanBookRequest, Model model) {
    	User user = userService.userDeleteSearch(userPlanBookRequest);
    	userService.midokuBook(userPlanBookRequest);
        model.addAttribute("midokuMessage", "未読に変更しました。");
        model.addAttribute("user", user);
        return "midokuComplete";
    }

}
