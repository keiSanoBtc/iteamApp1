package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.dto.BookUserEditRequest;
import com.example.demo.dto.UserSearchRequest;
import com.example.demo.entity.Book;
import com.example.demo.repository.BookMapper;;

@Service
public class BookService {

    @Autowired
    private BookMapper bookMapper;

    public List<Book> bookSearch(UserSearchRequest userSearchRequest) {

        return bookMapper.bookSearchedList(userSearchRequest);

    }

    public void addPlanBook(BookUserEditRequest bookUserEditRequest) {

        bookMapper.addPlanBook(bookUserEditRequest);

    }

    public Book lastPlanBookNum() {

    	return bookMapper.lastPlanBookNum();

    }

}
