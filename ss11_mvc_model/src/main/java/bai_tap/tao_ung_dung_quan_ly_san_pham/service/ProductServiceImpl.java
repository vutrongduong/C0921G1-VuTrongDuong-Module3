package bai_tap.tao_ung_dung_quan_ly_san_pham.service;

import bai_tap.tao_ung_dung_quan_ly_san_pham.model.Product;
import bai_tap.tao_ung_dung_quan_ly_san_pham.repository.IProductRepository;
import bai_tap.tao_ung_dung_quan_ly_san_pham.repository.ProductRepository;

import java.util.List;

public class ProductServiceImpl implements IProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> display() {
        return productRepository.display();
    }

    @Override
    public void add(Product product) {
        productRepository.add(product);
    }

    @Override
    public void update(int id, Product product) {
        productRepository.update(id, product);
    }

    @Override
    public void delete(int id) {
        productRepository.delete(id);
    }

    @Override
    public Product search(int id) {
        return productRepository.search(id);
    }
}
