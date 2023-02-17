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
                    .prepareStatement("select f.food_id, f.img_url, f.food_name, f.food_description, f.price, fc.food_category_name \n" +
                            "from food f \n" +
                            "inner join food_category fc on fc.food_category_id = f.food_category_id \n" +
                            "where food_name like concat ('%', ? , '%') limit 6");
            preparedStatement.setString(1, search);
            ResultSet resultSet = preparedStatement.executeQuery();
            Food food;
            while (resultSet.next()) {
                food = new Food();
                food.setId(resultSet.getInt("f.food_id"));
                food.setImgURL(resultSet.getString("f.img_url"));
                food.setName(resultSet.getString("f.food_name"));
                food.setDescription(resultSet.getString("f.food_description"));
                food.setPrice(resultSet.getInt("f.price"));
                food.setCategory_name(resultSet.getString("fc.food_category_name"));
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

    @Override
    public void addNewFood(Food food) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("insert into food (food_name, food_description, price, img_url, food_category_id) values (?, ?, ?, ?, ?)");
            preparedStatement.setString(1, food.getName());
            preparedStatement.setString(2, food.getDescription());
            preparedStatement.setInt(3, food.getPrice());
            preparedStatement.setString(4, food.getImgURL());
            preparedStatement.setString(5, food.getCategory_name());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void deleteFood(int id) {
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("delete from food where food_id = ?");
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
