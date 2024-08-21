package com.hasib.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.hasib.entity.Users;
import com.hasib.entity.interviewResult;

import jakarta.transaction.Transactional;

public interface interviewResultRepository extends JpaRepository<interviewResult, Integer> {
	// Method to find all interview results by uid (foreign key)
	List<interviewResult> findAllByUid(int uid);

	// Method to delete all interview results by uid
	@Transactional
	@Modifying
	@Query("DELETE FROM interviewResult ir WHERE ir.uid = :uid")
	void deleteByUid(int uid);
}
