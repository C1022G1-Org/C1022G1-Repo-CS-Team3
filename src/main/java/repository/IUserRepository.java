package repository;

import Model.User;

import java.util.List;

public interface IUserRepository {
    List<User> listAllUser();
    List<User> listByName (String search);
}
