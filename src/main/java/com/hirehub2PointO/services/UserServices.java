package com.hirehub2PointO.services;

import com.hirehub2PointO.dao.UserDao;
import com.hirehub2PointO.model.User;

public class UserServices {
    private final UserDao userDao = new UserDao();

    // save user
    public boolean saveUser(User user) {
        return userDao.save(user);
    }

    // return user obj if exist
    private User loginUser(String email, String password) {
        return userDao.get(email, password);
    }

    // register service
    private boolean registerUser(User user) {
        if (isUserExist(user.getUserMail())) {
            return false;
        }
        return userDao.save(user);
    }

    // if user exist
    public boolean isUserExist(String email) {
        return getUserByEmail(email) != null;
    }

    // update password
    public boolean updatePassword(String email, String password) {
        return userDao.update(email, password);
    }

    // getUserBy email
    public User getUserByEmail(String email) {
        return userDao.get(email);
    }

    // validate user
    public User validateUser(String email, String password) {
        User user = getUserByEmail(email);
        if (user != null && user.getPassword().equals(password)) return user;
        return null;
    }
}
