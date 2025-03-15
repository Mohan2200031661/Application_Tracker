package com.mb.project.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.mb.project.model.JobLink;

@Repository
public interface JobLinkRepository extends JpaRepository<JobLink,Integer >{

}
