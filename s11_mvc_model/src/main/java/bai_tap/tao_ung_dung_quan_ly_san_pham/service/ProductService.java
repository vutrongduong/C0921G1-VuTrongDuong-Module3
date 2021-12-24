package bai_tap.tao_ung_dung_quan_ly_san_pham.service;

import bai_tap.tao_ung_dung_quan_ly_san_pham.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> display();

    void add(Product product);

    void update(int id,Product product);

    void delete(int id);

    Product search(int id);
}
