package org.priceaggregator.aggregator.controller;

import org.priceaggregator.aggregator.model.Comparison;
import org.priceaggregator.aggregator.model.Product;
import org.priceaggregator.aggregator.model.User;
import org.priceaggregator.aggregator.repository.ComparisonRepo;
import org.priceaggregator.aggregator.repository.ProductRepo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Controller
public class ComparisonController {
    private final ProductRepo productRepo;
    private final ComparisonRepo comparisonRepo;

    public ComparisonController(ProductRepo productRepo, ComparisonRepo comparisonRepo) {
        this.productRepo = productRepo;
        this.comparisonRepo = comparisonRepo;
    }

    @GetMapping("/comparison")
    public String comparing(@AuthenticationPrincipal User user, Model model) {
        List<Comparison> comparisons = comparisonRepo.findAllByUser(user);
        model.addAttribute("products", comparisons);

        return "productComparison";
    }

    @PostMapping("/comparison/{productId}")
    public String addToComparing(@AuthenticationPrincipal User user, @PathVariable Long productId, Model model) {
        List<Comparison> comparisons = comparisonRepo.findAllByUser(user);
        Comparison comparison = new Comparison();

        Product product = productRepo.getProductById(productId);
        Long category_id = product.getCategory().getId();

        for (Comparison comparison1 : comparisons) {
            if (comparison1.getProduct().getCategory().getId() != category_id) {
                return "redirect:/product/" + category_id;
            }
        }

        if (comparisons.size() >= 3) {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Максимум 3 товари для порівняння");
            return "redirect:/product/" + category_id;
        }

        boolean hasDuplicate = false;
        Set<Long> productIds = new HashSet<>();
        if (comparisons.size() != 0) {
            for (Comparison comparison1 : comparisons) {
                productIds.add(comparison1.getProduct().getId());
            }

            for (Long id : productIds) {
                if (product.getId() == id) {
                    hasDuplicate = true;
                    break;
                }
            }

            if (!hasDuplicate) {
                comparison.setProduct(product);
                comparison.setUser(user);
                comparisonRepo.save(comparison);
                model.addAttribute("messageType", "success");
                model.addAttribute("message", "Додано до порівняння");
            }

        } else {
            comparison.setProduct(product);
            comparison.setUser(user);
            comparisonRepo.save(comparison);
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Додано до порівняння");
        }

        return "redirect:/product/" + category_id;
    }

    @PostMapping("/comparison-delete/{productId}")
    public String deleteProductComparison(@AuthenticationPrincipal User user, @PathVariable Long productId) {
        Product product = productRepo.getProductById(productId);
        Comparison comparison = comparisonRepo.findTop1ComparisonByProductAndUser(product, user);

        comparisonRepo.delete(comparison);

        return "redirect:/comparison";
    }
}
