package repository.impl;

import Model.Order;
import Model.User;
import repository.IOrderRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderRepository implements IOrderRepository {
    @Override
    public List<Order> listByName(String search) {
        List<Order> orderList = new ArrayList<>();
        PreparedStatement preparedStatement = null;
        try {
            preparedStatement = BaseRepository.getConnection()
                    .prepareStatement("select o.order_id, u.user_name, f.food_name, o.quantity  from `order`o\n" +
                            "inner join food f on o.food_id = f.food_id\n" +
                            "inner join users u on o.user_id = u.user_id\n" +
                            "where f.food_name like concat ('%', ? , '%') limit 6");
            preparedStatement.setString(1, search);
            ResultSet resultSet = preparedStatement.executeQuery();
            Order order;
            while (resultSet.next()) {
                order = new Order();
                order.setId(resultSet.getInt("o.order_id"));
                order.setUser(resultSet.getString("u.user_name"));
                order.setFood(resultSet.getString("f.food_name"));
                order.setQuantity(resultSet.getInt("o.quantity"));
                orderList.add(order);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return orderList;
    }
}
