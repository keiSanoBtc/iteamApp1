package com.example.demo.dto;

import java.io.Serializable;

import lombok.Data;

@Data
public class UserSearchRequest implements Serializable {

  private String name;

  public Long id;

}