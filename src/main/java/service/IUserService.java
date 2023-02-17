package service;

import Model.User;

import java.util.List;

public interface IUserService {
    List<User> listByName (String search);

    List<User> listAllUser();
}
