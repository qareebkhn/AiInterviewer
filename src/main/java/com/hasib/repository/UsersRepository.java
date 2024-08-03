package com.hasib.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hasib.entity.Users;

public interface UsersRepository extends JpaRepository<Users, Integer>{
	Users findByEmailAndPassword(String email, String password);
}
