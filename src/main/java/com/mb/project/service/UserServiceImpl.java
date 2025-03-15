package com.mb.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mb.project.model.User;
import com.mb.project.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserRepository userRepository;

	@Override
	public String addUser(User user) {
		userRepository.save(user);
		return "User Registered Successfully!..";
	}

	@Override
	public List<User> viewAllUser() {
		return userRepository.findAll();
	}

	@Override
	public User viewUserById(String uid) {
		Optional<User> object = userRepository.findById(uid);
		return object.get();
	}

	@Override
	public String deleteUser(String uid) {
		userRepository.deleteById(uid);
		return "User Deleted Successfully...";
	}

	@Override
	public User checkuserlogin(String uid, String password) {
		return userRepository.checkuserlogin(uid, password);
	}

	@Override
	public String updateuser(User user) {
		userRepository.save(user); // Save the updated user details
		return "User updated successfully";
	}
}
