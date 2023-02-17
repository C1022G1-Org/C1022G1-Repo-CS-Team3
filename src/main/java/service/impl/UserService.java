package service.impl;

import Model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    IUserRepository userRepository = new UserRepository();
    @Override
    public List<User> listByName(String search) {
        if (search == null) {
            search = "";
        }
        return userRepository.listByName(search);
    }

    @Override
    public List<User> listAllUser() {
        return userRepository.listAllUser();
    }
}
