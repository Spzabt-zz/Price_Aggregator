package org.priceaggregator.aggregator.repository;

import org.priceaggregator.aggregator.model.Comment;
import org.priceaggregator.aggregator.model.Product;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CommentRepo extends CrudRepository<Comment, Long> {
    List<Comment> findAllByProduct(Product product);
    Comment getCommentById(Long id);
}
