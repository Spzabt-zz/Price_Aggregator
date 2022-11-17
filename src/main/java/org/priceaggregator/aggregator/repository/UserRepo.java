package org.priceaggregator.aggregator.repository;

import org.priceaggregator.aggregator.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername (String username);
}
