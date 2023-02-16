package repository.impl;

import Model.Food;
import repository.IFoodRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FoodRepository implements IFoodRepository {
    @Override
    public List<Food> listByName(String search) {
        List<Food> foodList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select food_id, img_url, food_name, food_description, price from food where food_name like concat ('%', ? , '%') limit 6");
            preparedStatement.setString(1, search);
            ResultSet resultSet = preparedStatement.executeQuery();
            Food food;
            while (resultSet.next()) {
                food = new Food();
                food.setId(resultSet.getInt("food_id"));
                food.setImgURL(resultSet.getString("img_url"));
                food.setName(resultSet.getString("food_name"));
                food.setDescription(resultSet.getString("food_description"));
                food.setPrice(resultSet.getInt("price"));
                foodList.add(food);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return foodList;
    }

    @Override
    public List<Food> listFood() {
        List<Food> foodList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select food_id, img_url, food_name, food_description, price from food where food_category_id = 1");
            ResultSet resultSet = preparedStatement.executeQuery();
            Food food;
            while (resultSet.next()) {
                food = new Food();
                food.setId(resultSet.getInt("food_id"));
                food.setImgURL(resultSet.getString("img_url"));
                food.setName(resultSet.getString("food_name"));
                food.setDescription(resultSet.getString("food_description"));
                food.setPrice(resultSet.getInt("price"));
                foodList.add(food);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return foodList;
    }

    @Override
    public List<Food> listFastFood() {
        List<Food> foodList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select food_id, img_url, food_name, food_description, price from food where food_category_id = 2");
            ResultSet resultSet = preparedStatement.executeQuery();
            Food food;
            while (resultSet.next()) {
                food = new Food();
                food.setId(resultSet.getInt("food_id"));
                food.setImgURL(resultSet.getString("img_url"));
                food.setName(resultSet.getString("food_name"));
                food.setDescription(resultSet.getString("food_description"));
                food.setPrice(resultSet.getInt("price"));
                foodList.add(food);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return foodList;
    }

    @Override
    public List<Food> ListBeverage() {
        List<Food> foodList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select food_id, img_url, food_name, food_description, price from food where food_category_id = 3");
            ResultSet resultSet = preparedStatement.executeQuery();
            Food food;
            while (resultSet.next()) {
                food = new Food();
                food.setId(resultSet.getInt("food_id"));
                food.setImgURL(resultSet.getString("img_url"));
                food.setName(resultSet.getString("food_name"));
                food.setDescription(resultSet.getString("food_description"));
                food.setPrice(resultSet.getInt("price"));
                foodList.add(food);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return foodList;
    }
}
