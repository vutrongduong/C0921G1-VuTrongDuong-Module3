package service;

import model.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    static Map<Integer, Product> productMap;

    static {
        productMap.put(1, new Product(1, "KR", "Iphone X", 1200, 10, "black", "100%"));
        productMap.put(2, new Product(2, "US", "Iphone 12", 1500, 20, "white", "99%"));
        productMap.put(3, new Product(1, "JP", "Samsung S20", 1100, 15, "blue", "100%"));
        productMap.put(4, new Product(1, "VN", "Iphone 11", 900, 30, "red", "98%"));
    }

    @Override
    public List<Product> display() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public void add(Product product) {
        productMap.put(product.getId(), product);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id, product);
    }

    @Override
    public void delete(int id) {
        productMap.remove(id);
    }

    @Override
    public Product search(int id) {
        return productMap.get(id);
    }

}
