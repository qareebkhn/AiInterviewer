package com.hasib.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hasib.entity.Users;
import com.hasib.entity.interviewResult;

public interface interviewResultRepository extends JpaRepository<interviewResult, Integer> {
	 // Method to find all interview results by uid (foreign key)
    List<interviewResult> findAllByUid(int uid);
}
