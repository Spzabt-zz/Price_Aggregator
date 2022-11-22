package org.priceaggregator.aggregator.repository;

import org.priceaggregator.aggregator.model.Comparison;
import org.priceaggregator.aggregator.model.Product;
import org.priceaggregator.aggregator.model.User;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ComparisonRepo extends CrudRepository<Comparison, Long> {
    List<Comparison> findAllByUser(User user);
    List<Comparison> findAllByProduct(Product product);
    Comparison findTop1ComparisonByProductAndUser(Product product, User user);
}
