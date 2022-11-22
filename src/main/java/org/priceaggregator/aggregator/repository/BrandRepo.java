package org.priceaggregator.aggregator.repository;

import org.priceaggregator.aggregator.model.Brand;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BrandRepo extends CrudRepository<Brand, Long> {
    List<Brand> findAllByCategory_Id(Long category_id);
}
