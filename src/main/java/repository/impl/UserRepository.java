package repository.impl;

import Model.Food;
import Model.User;
import repository.IUserRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements IUserRepository {
    @Override
    public List<User> listAllUser() {
        List<User> userList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select * from users limit 6");
            ResultSet resultSet = preparedStatement.executeQuery();
            User user;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setName(resultSet.getString("user_name"));
                user.setLoginName(resultSet.getString("user_login_name"));
                user.setloginPassword(resultSet.getString("user_login_password"));
                user.setRole(resultSet.getString("user_role"));
                user.setDateOfBirth(resultSet.getString("date_of_birth"));
                user.setGender(resultSet.getInt("gender"));
                user.setEmail(resultSet.getString("email"));
                user.setAddress(resultSet.getString("address"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }

    @Override
    public List<User> listByName(String search) {
        List<User> userList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select * from users where user_name like concat ('%', ? , '%') limit 6");
            preparedStatement.setString(1, search);
            ResultSet resultSet = preparedStatement.executeQuery();
            User user;
            while (resultSet.next()) {
                user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setName(resultSet.getString("user_name"));
                user.setLoginName(resultSet.getString("user_login_name"));
                user.setloginPassword(resultSet.getString("user_login_password"));
                user.setRole(resultSet.getString("user_role"));
                user.setDateOfBirth(resultSet.getString("date_of_birth"));
                user.setGender(resultSet.getInt("gender"));
                user.setEmail(resultSet.getString("email"));
                user.setAddress(resultSet.getString("address"));
                userList.add(user);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return userList;
    }
}
