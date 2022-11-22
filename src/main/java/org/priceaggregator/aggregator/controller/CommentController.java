package org.priceaggregator.aggregator.controller;

import org.priceaggregator.aggregator.model.Comment;
import org.priceaggregator.aggregator.model.Product;
import org.priceaggregator.aggregator.model.User;
import org.priceaggregator.aggregator.repository.CommentRepo;
import org.priceaggregator.aggregator.repository.ProductRepo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class CommentController {
    private final CommentRepo commentRepo;
    private final ProductRepo productRepo;

    public CommentController(CommentRepo commentRepo, ProductRepo productRepo) {
        this.commentRepo = commentRepo;
        this.productRepo = productRepo;
    }

    @PostMapping("/product-details/{product_id}")
    public String leaveComment(@AuthenticationPrincipal User user,
                               Model model,
                               @PathVariable Long product_id,
                               @RequestParam String comment) {
        Product product = productRepo.getProductById(product_id);
        Comment newComment = new Comment();

        List<Comment> comments = commentRepo.findAllByProduct(product);

        model.addAttribute("product", product);
        model.addAttribute("comments", comments);

        if (!StringUtils.isEmpty(comment)) {
            newComment.setText(comment);
            newComment.setUser(user);
            newComment.setProduct(product);

            commentRepo.save(newComment);
        } else {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Кометар не може бути пустим");
            return "productDetails";
        }

        return "redirect:/product-details/" + product.getId();
    }

    @PostMapping("/comment-delete/{commentId}")
    public String deleteComment(Model model,
                               @PathVariable Long commentId) {
        Comment commentById = commentRepo.getCommentById(commentId);
        Product product = productRepo.getProductById(commentById.getProduct().getId());

        commentRepo.delete(commentById);

        List<Comment> comments = commentRepo.findAllByProduct(product);

        model.addAttribute("product", product);
        model.addAttribute("comments", comments);

        return "redirect:/product-details/" + product.getId();
    }
}
