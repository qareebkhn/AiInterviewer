package com.hasib.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hasib.entity.Users;

public interface UsersRepository extends JpaRepository<Users, Integer>{
	// Method to find user by email and password (for sign in authentication)
	Users findByEmailAndPassword(String email, String password);
}
