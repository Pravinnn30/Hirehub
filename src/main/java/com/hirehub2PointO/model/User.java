package com.hirehub2PointO.model;


import jakarta.persistence.*;

@Entity
@Table(name = "User")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "userstatus", length = 20)
    private String userStatus;

    @Column(name = "username", nullable = false, length = 20)
    private String username;

    @Column(name = "usergmail", nullable = false, length = 50, unique = true)
    private String userGmail;

    @Column(name = "password", nullable = false, length = 20)
    private String password;

    public String getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(String userStatus) {
        this.userStatus = userStatus;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserMail() {
        return userGmail;
    }

    public void setUserMail(String userMail) {
        this.userGmail = userMail;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}


