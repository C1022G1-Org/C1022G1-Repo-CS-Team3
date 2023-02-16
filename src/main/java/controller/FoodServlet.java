package controller;

import Model.Food;
import repository.impl.BaseRepository;
import service.IFoodService;
import service.impl.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "FoodServlet", value = "/food")
public class FoodServlet extends HttpServlet {
    IFoodService foodService = new FoodService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }

        switch (actionUser) {
            case "foodlist":
                showFoodList (request, response);
                break;
            case "fastfoodlist":
                showFastFoodList (request, response);
                break;
            case "beveragelist":
                showBeverageList (request, response);
                break;
            default:
                showTotalListFood (request, response);
                break;
        }
    }

    private void showBeverageList(HttpServletRequest request, HttpServletResponse response) {
        List<Food> foodList = foodService.ListBeverage();
        request.setAttribute("foodList", foodList);
        try {
            request.getRequestDispatcher("/view/user/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFastFoodList(HttpServletRequest request, HttpServletResponse response) {
        List<Food> foodList = foodService.listFastFood();
        request.setAttribute("foodList", foodList);
        try {
            request.getRequestDispatcher("/view/user/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showFoodList(HttpServletRequest request, HttpServletResponse response) {
        List<Food> foodList = foodService.listFood();
        request.setAttribute("foodList", foodList);
        try {
            request.getRequestDispatcher("/view/user/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showTotalListFood(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        List<Food> foodList = foodService.listByName(search);
        request.setAttribute("foodList", foodList);
        request.setAttribute("search", search);
        try {
            request.getRequestDispatcher("/view/user/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
