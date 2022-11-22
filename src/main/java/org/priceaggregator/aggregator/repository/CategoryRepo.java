package org.priceaggregator.aggregator.repository;

import org.priceaggregator.aggregator.model.Category;
import org.springframework.data.repository.CrudRepository;

public interface CategoryRepo extends CrudRepository<Category, Long> {
    Category getCategoryById(Long id);
}
