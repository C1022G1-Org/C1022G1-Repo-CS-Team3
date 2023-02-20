package repository;

import Model.Order;

import java.util.List;

public interface IOrderRepository {
    List<Order> listByName (String search);
    int findIdByFoodName (String foodName);
    int findIdByUserName (String userName);
    void addOrder(Order order);
}
