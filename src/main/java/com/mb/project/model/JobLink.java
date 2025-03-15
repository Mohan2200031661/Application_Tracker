package com.mb.project.model;
import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "job_link_table")
public class JobLink 
{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "company_name", nullable = false, length = 100)
    private String companyName;

    @Column(name = "job_description", nullable = false, length = 1000)
    private String jobDescription;

    @Column(name = "application_link", nullable = false, length = 1000)
    private String applicationLink;

    @Column(name = "closing_date_time", nullable = false)
    private LocalDateTime closingDateTime;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false)
    private Status status;

    public enum Status {
        OPEN, CLOSED;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getApplicationLink() {
        return applicationLink;
    }

    public void setApplicationLink(String applicationLink) {
        this.applicationLink = applicationLink;
    }

    public LocalDateTime getClosingDateTime() {
        return closingDateTime;
    }

    public void setClosingDateTime(LocalDateTime closingDateTime) {
        this.closingDateTime = closingDateTime;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
