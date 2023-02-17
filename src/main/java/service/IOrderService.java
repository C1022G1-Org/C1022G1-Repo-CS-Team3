package service;

import Model.Order;

import java.util.List;

public interface IOrderService {
    List<Order> listByName (String search);
}
