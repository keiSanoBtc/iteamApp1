package com.example.demo.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class BookUserEditRequest implements Serializable {

	public Long user_id;

	public Long book_id;

	public String book_name;

	public Long last_id;

}
