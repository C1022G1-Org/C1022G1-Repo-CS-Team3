package Model;

public class Order {
    private int id;
    private String user;
    private String food;
    private int quantity;

    public Order() {
    }

    public Order(int id, String user, String food, int quantity) {
        this.id = id;
        this.user = user;
        this.food = food;
        this.quantity = quantity;
    }

    public Order(String food, String user, int quantity) {
        this.user = user;
        this.food = food;
        this.quantity = quantity;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
