package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.entity.Book;
import com.example.demo.service.BookService;

@Controller
public class BookController {


	@Autowired
	BookService bookService;

//	 本棚を表示
	 @RequestMapping(value = "/bookshelf", method = RequestMethod.GET)
	 public String bookShelf(Model model) {
//		 ユーザー、本のリスト
//		 アトリビュート
		 List<Book> allBookList = bookService.bookSearch();
		 System.out.println(allBookList);
//		 System.out.println(user);
//		 System.out.println(userPlanBookList);
		 model.addAttribute("allBookList", allBookList);
		return "bookshelf";
	 }
}
