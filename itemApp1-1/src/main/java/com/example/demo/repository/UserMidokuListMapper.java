package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.entity.UserMidokuList;

@Mapper
public interface UserMidokuListMapper {

	List<UserMidokuList> userMidokuList();

}
