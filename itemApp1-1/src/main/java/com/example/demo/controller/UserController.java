package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		 return "userSearch";
	 }

//	 利用者ごとのページを表示
	 @RequestMapping(value = "/user", method = RequestMethod.POST)
	 public String userSearch(@ModelAttribute UserSearchRequest userSearchRequest, Model model){
		 List<Book> userPlanBookList = userService.userPlanBookList(userSearchRequest);
		 List<Book> userPastBookList = userService.userPastBookList(userSearchRequest);
		 User user = userService.userSearch(userSearchRequest);
		 System.out.println(userSearchRequest.name);
		 System.out.println(userPlanBookList);
		 System.out.println(userPastBookList);
		 model.addAttribute("user", user);
		 model.addAttribute("userPastBookList", userPastBookList);
		 model.addAttribute("userPlanBookList", userPlanBookList);
	     return "user";
	 }

//	 本棚を表示
	 @RequestMapping(value = "/bookshelf", method = RequestMethod.POST)
	 public String bookShelf(@ModelAttribute UserSearchRequest userSearchRequest, Model model) {
//		 ユーザー、本のリスト
//		 アトリビュート
		return "bookshelf";
	 }


//  読みたい本の編集
	 @RequestMapping(value = "/edit", method = RequestMethod.POST)
	 public String editPlanBook(@ModelAttribute UserPlanBookRequest userPlanBookRequest, Model model) {
		 UserPlanBook userPlanBook = userService.userPlanBookEdit(userPlanBookRequest);
		 model.addAttribute("userPlanBook", userPlanBook);
		 return "edit";
	    }


//  読みたい本の編集完了
	@RequestMapping(value = "/editComplete", method = RequestMethod.POST)
	 public String editPlanBookComplete(@ModelAttribute UserPlanBookEditRequest userPlanBookEditRequest, Model model) {
		userService.userPlanBookEditComplete(userPlanBookEditRequest);
		return "editComplete";
	}


//  読みたい本の削除
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String deletePlanBook(@ModelAttribute UserPlanBookRequest userPlanBookRequest, Model model) {
    	userService.deletePlanBook(userPlanBookRequest);
    	System.out.println(userPlanBookRequest.user_id);
    	System.out.println(userPlanBookRequest.book_id);
        model.addAttribute("deleteMessage", "削除しました。");
        return "deleteComplete";
    }

//  読みたい本を既読する
    @RequestMapping(value = "/kidokuComplete", method = RequestMethod.POST)
    public String postBook(@ModelAttribute UserPlanBookRequest userPlanBookRequest, Model model) {
    	userService.postBook(userPlanBookRequest);
    	System.out.println(userPlanBookRequest.user_id);
    	System.out.println(userPlanBookRequest.book_id);
        model.addAttribute("message", "既読しました。");
        return "kidokuComplete";
    }

//  ユーザ一覧を表示（テスト）
    @RequestMapping(value = "/userList", method = RequestMethod.GET)
    public String userList(Model model) {
//    	List<User> userList = new ArrayList<User>();
//    	User user1 = new User();
//    	User user2 = new User();
//    	user1.name = "佐野";
//    	user2.name = "大井";
//    	userList.add(user1);
//    	userList.add(user2);
//    	model.addAttribute("userList", userList);
        return "userList";
    }
}
