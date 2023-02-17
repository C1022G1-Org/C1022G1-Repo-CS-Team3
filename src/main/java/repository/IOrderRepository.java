package repository;

import Model.Order;

import java.util.List;

public interface IOrderRepository {
    List<Order> listByName (String search);
}
