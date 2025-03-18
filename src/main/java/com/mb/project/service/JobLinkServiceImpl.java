package com.mb.project.service;

import com.mb.project.model.JobLink;
import com.mb.project.model.JobLink.Status;
import com.mb.project.repository.JobLinkRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class JobLinkServiceImpl 
{

    @Autowired
    private JobLinkRepository jobLinkRepository;

    
    public String addJob(JobLink job) 
    {
    	jobLinkRepository.save(job);
    	return "Job Link Added Successfully";
    }
    
    public List<JobLink> viewalljoblinks()
    {
    	return jobLinkRepository.findAll();
    }
    
    public long jobcount() 
	{
		return jobLinkRepository.count();
	}
    
    public String deletejob(int jid)
    {
    	jobLinkRepository.deleteById(jid);
    	return "Job Deleted Successfully";
    }
    
    public String updatejob(JobLink j) 
	{
		JobLink jl = jobLinkRepository.findById(j.getId()).get();
		
		jl.setApplicationLink(j.getApplicationLink());
		jl.setCompanyName(j.getCompanyName());
		jl.setClosingDateTime(j.getClosingDateTime());
		jl.setJobDescription(j.getJobDescription());
		jl.setStatus(j.getStatus());
		
		
		jobLinkRepository.save(jl);
		
		return "Job  Updated Successfully.";	
	}
    
    public JobLink findById(int id) {
        return jobLinkRepository.findById(id).orElse(null);
    }
    
    @Scheduled(fixedRate = 60000)
    public void updateJobStatus() {
        List<JobLink> jobLinks = jobLinkRepository.findAll();
        LocalDateTime now = LocalDateTime.now();

        for (JobLink job : jobLinks) {
            if (job.getClosingDateTime().isBefore(now) && job.getStatus() == JobLink.Status.OPEN) {
                job.setStatus(JobLink.Status.CLOSED);
                jobLinkRepository.save(job);
            }
        }
    }

}