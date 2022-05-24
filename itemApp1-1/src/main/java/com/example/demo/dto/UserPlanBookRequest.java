package com.example.demo.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class UserPlanBookRequest implements Serializable {

	 public Long user_id;

	 public Long book_id;

}
