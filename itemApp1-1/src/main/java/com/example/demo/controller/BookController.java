package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.dto.BookUserEditRequest;
import com.example.demo.dto.UserSearchRequest;
import com.example.demo.entity.Book;
import com.example.demo.entity.User;
import com.example.demo.service.BookService;
import com.example.demo.service.UserService;

@Controller
public class BookController {


	@Autowired
	BookService bookService;

	@Autowired
	UserService userService;

//	 本棚を表示
	 @RequestMapping(value = "/bookshelf", method = RequestMethod.POST)
	 public String bookShelf(@ModelAttribute UserSearchRequest userSearchRequest, Model model) {
		 User user = userService.userSearchById(userSearchRequest);
		 List<Book> myNotReadBookList = bookService.bookSearch(userSearchRequest);
		 System.out.println(user.id);
		 model.addAttribute("user", user);
		 model.addAttribute("myNotReadBookList", myNotReadBookList);
		return "bookshelf";
	 }

//	 読みたい本に追加
	 @RequestMapping(value = "/addPlanBook", method = RequestMethod.POST)
	 public String addPlanBook(@ModelAttribute BookUserEditRequest bookUserEditRequest, Model model) {
		 Book book = bookService.lastPlanBookNum();
		 bookUserEditRequest.last_id = book.id +1;
		 bookService.addPlanBook(bookUserEditRequest);
		return "deleteComplete";
	 }
}
