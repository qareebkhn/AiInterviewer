package com.hasib.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hasib.entity.Users;
import com.hasib.entity.interviewResult;

public interface interviewResultRepository extends JpaRepository<interviewResult, Integer> {

}
