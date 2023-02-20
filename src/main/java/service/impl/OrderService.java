package service.impl;

import Model.Order;
import repository.IOrderRepository;
import repository.impl.OrderRepository;
import service.IOrderService;

import java.util.List;

public class OrderService implements IOrderService {
    IOrderRepository orderRepository = new OrderRepository();
    @Override
    public List<Order> listByName(String search) {
        if (search == null) {
            search = "";
        }
        return orderRepository.listByName(search);
    }

    @Override
    public int findIdByFoodName(String foodName) {
        return orderRepository.findIdByFoodName(foodName);
    }

    @Override
    public int findIdByUserName(String userName) {
        return orderRepository.findIdByUserName(userName);
    }

    @Override
    public void addOrder(Order order) {
        orderRepository.addOrder (order);
    }
}
