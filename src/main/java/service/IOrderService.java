package service;

import Model.Order;

import java.util.List;

public interface IOrderService {
    List<Order> listByName (String search);
    int findIdByFoodName (String foodName);
    int findIdByUserName (String userName);

    void addOrder(Order order);
}
