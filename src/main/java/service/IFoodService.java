package service;

import Model.Food;

import java.util.List;

public interface IFoodService {
    List<Food> listByName(String seach);
    List<Food> listFood();
    List<Food> listFastFood();
    List<Food> ListBeverage();
    void addNewFood (Food food);

    void deleteFood(int id);
}
