package controller;

import Model.Food;
import service.IFoodService;
import service.impl.FoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminFoodServlet", value = "/adminFood")
public class AdminFoodServlet extends HttpServlet {
    IFoodService foodService = new FoodService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }

        switch (actionUser) {
            case "add":
                performCreate (request, response);
                break;
            default:
                showTotalListFood (request, response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }

        switch (actionUser) {
            case "delete":
                performDelete (request, response);
                break;
            case "edit":
                showEditForm (request, response);
                break;
            default:
                showTotalListFood (request, response);
                break;
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {

    }

    private void performDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        foodService.deleteFood (id);
        try {
            response.sendRedirect("/adminFood");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void performCreate(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        String imgURL = request.getParameter("imgURL");
        String description = request.getParameter("description");
        int price = Integer.parseInt(request.getParameter("price"));
//        String category_name = request.getParameter("category_name");
        Food food = new Food(name, description, price, imgURL, category);
        foodService.addNewFood(food);
        try {
            response.sendRedirect("/adminFood");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showTotalListFood(HttpServletRequest request, HttpServletResponse response) {
        String search = request.getParameter("search");
        List<Food> foodList = foodService.listByName(search);
        request.setAttribute("foodList", foodList);
        request.setAttribute("search", search);
        try {
            request.getRequestDispatcher("/view/admin/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
