package org.priceaggregator.aggregator.controller;

import org.priceaggregator.aggregator.model.Brand;
import org.priceaggregator.aggregator.model.Comparison;
import org.priceaggregator.aggregator.model.Product;
import org.priceaggregator.aggregator.model.User;
import org.priceaggregator.aggregator.repository.BrandRepo;
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
    private final BrandRepo brandRepo;

    public ComparisonController(ProductRepo productRepo, ComparisonRepo comparisonRepo, BrandRepo brandRepo) {
        this.productRepo = productRepo;
        this.comparisonRepo = comparisonRepo;
        this.brandRepo = brandRepo;
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

        //---
        List<Product> products = productRepo.findAllByCategory_Id(category_id);
        List<Brand> brands = brandRepo.findAllByCategory_Id(category_id);

        model.addAttribute("brands", brands);
        model.addAttribute("products", products);
        model.addAttribute("category_id", category_id);
        //---

        if (comparisons.size() >= 3) {
            model.addAttribute("messageType", "danger");
            model.addAttribute("message", "Максимум 3 товари для порівняння");
            return "product";
        }

        for (Comparison comparison1 : comparisons) {
            if (comparison1.getProduct().getCategory().getId() != category_id) {
                model.addAttribute("messageType", "danger");
                model.addAttribute("message", "Неможна додавати товари для порівння з різних категорій");
                return "product";
            }
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
            } else {
                model.addAttribute("messageType", "danger");
                model.addAttribute("message", "Неможна додавати до порівняння однаковий товар");
            }

        } else {
            comparison.setProduct(product);
            comparison.setUser(user);
            comparisonRepo.save(comparison);
            model.addAttribute("messageType", "success");
            model.addAttribute("message", "Додано до порівняння");
        }

        return "product";
    }

    @PostMapping("/comparison-delete/{productId}")
    public String deleteProductComparison(@AuthenticationPrincipal User user, @PathVariable Long productId) {
        Product product = productRepo.getProductById(productId);
        Comparison comparison = comparisonRepo.findTop1ComparisonByProductAndUser(product, user);

        comparisonRepo.delete(comparison);

        return "redirect:/comparison";
    }
}
