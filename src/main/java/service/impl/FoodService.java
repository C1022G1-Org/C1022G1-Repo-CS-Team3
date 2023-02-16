package service.impl;

import Model.Food;
import repository.IFoodRepository;
import repository.impl.FoodRepository;
import service.IFoodService;

import java.util.List;

public class FoodService implements IFoodService {
    IFoodRepository foodRepository = new FoodRepository();
    @Override
    public List<Food> listByName(String search) {
        if (search == null) {
            search = "";
        }
        return foodRepository.listByName(search);
    }

    @Override
    public List<Food> listFood() {
        return foodRepository.listFood();
    }

    @Override
    public List<Food> listFastFood() {
        return foodRepository.listFastFood();
    }

    @Override
    public List<Food> ListBeverage() {
        return foodRepository.ListBeverage();
    }


}
