package org.priceaggregator.aggregator.repository;

import org.priceaggregator.aggregator.model.Product;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductRepo extends CrudRepository<Product, Long> {
    List<Product> findAllByCategory_Id(Long category_id);
    Product getProductById(Long id);
    List<Product> findAllByBrandName(String brandName);
    List<Product> findAllByBrandNameOrderByPriceAsc(String brandName);
    List<Product> findAllByBrandNameOrderByPriceDesc(String brandName);
    List<Product> findAllByCategory_IdOrderByPriceAsc(Long category_id);
    List<Product> findAllByCategory_IdOrderByPriceDesc(Long category_id);
}
