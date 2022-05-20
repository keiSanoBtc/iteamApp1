package com.example.demo.entity;

import lombok.Data;

@Data
public class Book {

    private Long user_id;

    private Long book_id;

    private String book_name;
}