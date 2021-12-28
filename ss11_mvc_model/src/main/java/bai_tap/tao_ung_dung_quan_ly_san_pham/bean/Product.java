package bai_tap.tao_ung_dung_quan_ly_san_pham.bean;

public class Product {
    private int id;
    private String code;
    private String name;
    private int price;
    private int amount;
    private String description;
    private String status;

    public Product() {
    }

    public Product(int id, String code, String name, int price, int amount, String description, String status) {
        this.id = id;
        this.code = code;
        this.name = name;
        this.price = price;
        this.amount = amount;
        this.description = description;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", amount=" + amount +
                ", description='" + description + '\'' +
                ", status='" + status + '\'' +
                '}';
    }
}
