package com.example.demo.dto;

import java.io.Serializable;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class UserPlanBookEditRequest implements Serializable {

	public Long user_id;

	public Long book_id;

	@NotEmpty(message = "名前を入力してください")
	@Size(max = 15, message = "名前は15桁以内で入力してください")
	public String book_name;

}
