package com.mb.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mb.project.model.JobApplication;

public interface JobApplicationRepository extends JpaRepository<JobApplication, Integer> {

}
