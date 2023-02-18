package controller;

import Model.Food;
import Model.User;
import repository.impl.BaseRepository;
import service.IFoodService;
import service.IUserService;
import service.impl.FoodService;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet(name = "UserFoodServlet", value = "/food")
public class UserFoodServlet extends HttpServlet {
    IFoodService foodService = new FoodService();
    IUserService userService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "login":
                performLogin (request, response);
                break;
            case "register":
                performRegister (request, response);
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
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
            case "buy":
                showBuyForm (request, response);
                break;
            case "login":
                showLoginForm (request, response);
                break;
            case "register":
                showRegisterForm (request, response);
                break;
            default:
                showTotalListFood (request, response);
                break;
        }
    }

    private void showRegisterForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/dang_ky.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void performRegister(HttpServletRequest request, HttpServletResponse response) {
        String loginName = request.getParameter("loginName");
        String loginPassword = request.getParameter("loginPassword");
        String name = request.getParameter("name");
        String role = request.getParameter("role");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String gender = request.getParameter("gender");
        switch (gender) {
            case "M":
                gender = "0";
                break;
            case "F":
                gender = "1";
                break;
        }
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        User user = new User(name, loginName, loginPassword, role, dateOfBirth, gender, email, address);
        userService.addUser(user);
        try {
            response.sendRedirect("/view/login.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showLoginForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/login.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void performLogin(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("username");
        String passWord = request.getParameter("password");
        User user = userService.checkLogin(userName, passWord);
        String search = request.getParameter("search");
        List<Food> foodList = foodService.listByName(search);
        request.setAttribute("foodList", foodList);
        request.setAttribute("search", search);
        if (user == null) {
            try {
                response.sendRedirect("/view/login_again.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (user.getLoginName().equals("admin") && user.getloginPassword().equals("admin")){
            try {
                response.sendRedirect("/adminFood");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                request.getRequestDispatcher("/view/user/list.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }

        }
    }

    private void showBuyForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Food food = foodService.findById(id);
        request.setAttribute("food", food);
        try {
            request.getRequestDispatcher("/view/user/buy.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
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
