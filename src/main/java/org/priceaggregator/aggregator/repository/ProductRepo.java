package org.priceaggregator.aggregator.repository;

import org.priceaggregator.aggregator.model.Category;
import org.priceaggregator.aggregator.model.Product;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ProductRepo extends CrudRepository<Product, Long> {
    List<Product> findAllByCategory_Id(Long category_id);
    Product getProductById(Long id);
}
