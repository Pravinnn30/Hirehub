package com.hirehub2PointO.model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDate;

@Entity
@Table(name = "jobs")
public class Job {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int jobId;

    @Column(name = "title", nullable = false, length = 50)
    private String title;

    @Column(name = "type", nullable = false, length = 30)
    private String type;

    @Column(name = "description", nullable = false, length = 1000)
    private String description;

    @Column(name = "location", nullable = false, length = 50)
    private String location;

    @Column(name = "salary", nullable = false, length = 30)
    private String salary;

    @Column(name = "skills", nullable = false, length = 300)
    private String skills;

    @Column(name = "experience", nullable = false, length = 50)
    private String experience;

    @Column(name = "companyName", nullable = false, length = 100)
    private String companyName;

    @Column(name = "companyLink", nullable = false, length = 200)
    private String companyWebsite;

    @CreationTimestamp
    @Column(name = "posted_date", updatable = false)
    private LocalDate postedDate;

    @Column(name="lastdate",nullable = false)
    private LocalDate lastDate;

    public int getJobId() {
        return jobId;
    }

    public void setJobId(int jobId) {
        this.jobId = jobId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getSkills() {
        return skills;
    }

    public void setSkills(String skills) {
        this.skills = skills;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public LocalDate getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(LocalDate postedDate) {
        this.postedDate = postedDate;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getCompanyWebsite() {
        return companyWebsite;
    }

    public void setCompanyWebsite(String companyWebsite) {
        this.companyWebsite = companyWebsite;
    }

    public LocalDate getLastDate() {
        return lastDate;
    }

    public void setLastDate(LocalDate lastDate) {
        this.lastDate = lastDate;
    }

}

