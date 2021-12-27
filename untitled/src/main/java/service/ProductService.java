package service;

import model.Product;

import java.util.List;

public interface ProductService {
    List<Product> display();

    void add(Product product);

    void update(int id, Product product);

    void delete(int id);

    Product search(int id);
}
