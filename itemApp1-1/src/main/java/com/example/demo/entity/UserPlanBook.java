package com.example.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;

@AllArgsConstructor
@Data
public class UserPlanBook {

    public Long user_id;

    public Long book_id;

    public String book_name;
}