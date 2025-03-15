package com.mb.project.service;

import java.util.List;

import com.mb.project.model.User;


public interface UserService {
	
	public String addUser(User user);
	public List<User> viewAllUser();
	public User viewUserById(String uid);
	public String deleteUser(String uid);
	public String updateuser(User user);
	public User checkuserlogin(String uid, String password); 
	

}
