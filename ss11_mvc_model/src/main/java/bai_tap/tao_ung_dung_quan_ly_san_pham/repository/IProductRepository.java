package bai_tap.tao_ung_dung_quan_ly_san_pham.repository;

import bai_tap.tao_ung_dung_quan_ly_san_pham.bean.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> display();

    void add(Product product);

    void update(int id,Product product);

    void delete(int id);

    List<Product> search(String name);
    Product searchID(int id);
}
