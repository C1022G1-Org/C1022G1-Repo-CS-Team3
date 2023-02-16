package Model;

public class Food {
    private int id;
    private String name;
    private String description;
    private int price;
    private String imgURL;
    private String category_name;

    public Food() {
    }

    public Food(int id, String name, String description, int price, String imgURL, String category_name) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imgURL = imgURL;
        this.category_name = category_name;
    }

    public Food(String name, String description, int price, String imgURL, String category_id) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.imgURL = imgURL;
        this.category_name = category_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public String getCategory_id() {
        return category_name;
    }

    public void setCategory_id(String category_id) {
        this.category_name = category_id;
    }
}
