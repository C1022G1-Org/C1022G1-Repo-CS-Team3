package controller;

import Model.Food;
import Model.Order;
import Model.User;
import repository.impl.BaseRepository;
import repository.impl.UserRepository;
import service.IFoodService;
import service.IOrderService;
import service.IUserService;
import service.impl.FoodService;
import service.impl.OrderService;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "UserFoodServlet", value = "/food")
public class UserFoodServlet extends HttpServlet {
    IFoodService foodService = new FoodService();
    IUserService userService = new UserService();
    IOrderService orderService = new OrderService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "login":
                performLogin(request, response);
                break;
            case "register":
                performRegister(request, response);
                break;
            case "buy":
                showBuyForm(request, response);
                break;
            case "order":
                addOrder(request, response);
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
                showFoodList(request, response);
                break;
            case "fastfoodlist":
                showFastFoodList(request, response);
                break;
            case "beveragelist":
                showBeverageList(request, response);
                break;
            case "login":
                showLoginForm(request, response);
                break;
            case "logout":
                performLogout (request, response);
                break;
            case "buy":
                showBuyForm(request, response);
                break;
            case "register":
                showRegisterForm(request, response);
                break;
            default:
                showTotalListFood(request, response);
                break;
        }

    }

    private void performLogout(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        session.removeAttribute("us");
        try {
            response.sendRedirect("/view/user/list.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addOrder(HttpServletRequest request, HttpServletResponse response) {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String foodName = request.getParameter("foodName");
        String userName = request.getParameter("userName");
        Order order = new Order(foodName, userName, quantity);
        orderService.addOrder(order);
        try {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
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
        request.setAttribute("loginName", loginName);
        request.setAttribute("loginPassword", loginPassword);
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
            request.getRequestDispatcher("/view/register_login.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showBuyForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String loginName = request.getParameter("username");
        String loginPass = request.getParameter("password");
        request.setAttribute("loginName", loginName);
        request.setAttribute("loginPass", loginPass);
        Food food = foodService.findById(id);
        User user = foodService.findUserById(userId);
        request.setAttribute("food", food);
        request.setAttribute("user", user);
        try {
            request.getRequestDispatcher("/view/user/buy2.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
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
        if (user == null) {
            try {
                response.sendRedirect("/view/login_again.jsp");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (user.getLoginName().equals("admin") && user.getloginPassword().equals("admin")) {
            try {
                request.setAttribute("name", user.getName());
                response.sendRedirect("/adminFood");
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                request.setAttribute("name", user.getName());
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                session.setAttribute("us", user.getLoginName());
                session.setAttribute("pw", user.getloginPassword());
                session.setAttribute("userId", user.getId());

//                Cookie userCookie = new Cookie("userCookie", user.getLoginName());
//                Cookie passWordCookie = new Cookie("passWordCookie", user.getloginPassword());
//                response.addCookie(userCookie);
//                response.addCookie(passWordCookie);
//
//                Cookie[] cookieArr = request.getCookies();
//                if (cookieArr != null) {
//                    for (Cookie cookie : cookieArr) {
//                        if (cookie.getName().equals("userCookie")) {
//                            request.setAttribute("usName", cookie.getValue());
//                        }
//                        if (cookie.getName().equals("passWordCookie")) {
//                            request.setAttribute("pW", cookie.getValue());
//                        }
//                    }
//                }
//                userCookie.setMaxAge(60*60);
//                passWordCookie.setMaxAge(60*60);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
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
}
