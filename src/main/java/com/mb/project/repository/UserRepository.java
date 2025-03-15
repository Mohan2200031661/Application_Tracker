package com.mb.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.mb.project.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, String> 
{
	@Query("select u from User u where u.id=?1 and u.password=?2")
	User checkuserlogin(String uid,String password);
}
