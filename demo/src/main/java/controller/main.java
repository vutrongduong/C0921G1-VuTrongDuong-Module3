package controller;

import dao.ProductsImpl;
import model.Products;

import java.util.List;

public class main {
    public static void main(String[] args) {
        ProductsImpl products=new ProductsImpl();
        List<Products>productsList=products.selectAllUsers();
        for (Products e: productsList) {
            System.out.println(e);
        }
    }
}
