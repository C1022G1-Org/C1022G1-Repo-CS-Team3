package repository;

import Model.Food;

import java.util.List;

public interface IFoodRepository {
    List<Food> listByName(String search);
    List<Food> listFood();
    List<Food> listFastFood();
    List<Food> ListBeverage();
    void addNewFood (Food food);
    void deleteFood(int id);
    List<Food> listAllFood();
    Food findById (int id);
}
