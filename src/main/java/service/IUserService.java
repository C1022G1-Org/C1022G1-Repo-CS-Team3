package service;

import Model.User;

import java.util.List;

public interface IUserService {
    List<User> listByName (String search);
    User checkLogin (String userName, String passWord);
    List<User> listAllUser();
    void addUser (User user);
}
