package service;

import Model.Food;
import Model.User;

import java.util.List;

public interface IFoodService {
    List<Food> listByName(String seach);
    List<Food> listFood();
    List<Food> listFastFood();
    List<Food> ListBeverage();
    void addNewFood (Food food);
    void deleteFood(int id);
    List<Food> listAllFood();
    Food findById (int id);
    User findUserById (int userId);
    void updateFood(Food food);
}
