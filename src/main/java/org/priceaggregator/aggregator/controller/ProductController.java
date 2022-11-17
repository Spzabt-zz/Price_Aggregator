package org.priceaggregator.aggregator.controller;

import org.priceaggregator.aggregator.model.Category;
import org.priceaggregator.aggregator.model.Product;
import org.priceaggregator.aggregator.repository.CategoryRepo;
import org.priceaggregator.aggregator.repository.ProductRepo;
import org.priceaggregator.aggregator.service.ProductService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Controller
public class ProductController {
    private final ProductRepo productRepo;
    private final CategoryRepo categoryRepo;
    private final ProductService productService;

    @Value("${upload.path}")
    private String uploadPath;

    public ProductController(ProductRepo productRepo, CategoryRepo categoryRepo, ProductService productService) {
        this.productRepo = productRepo;
        this.categoryRepo = categoryRepo;
        this.productService = productService;
    }

    @GetMapping("/category")
    public String category(Model model)
    {
        Iterable<Category> categories = categoryRepo.findAll();
        model.addAttribute("categoryName", categories);
        return "category";
    }

    @GetMapping("/product/{category_id}")
    public String product(Model model, @PathVariable Long category_id) {
        List<Product> products = productRepo.findAllByCategory_Id(category_id);
        model.addAttribute("products", products);
        return "product";
    }

    @PostMapping("/product/{category_id}")
    public String productAdding(
            @RequestParam String name,
            @RequestParam String brandName,
            @RequestParam String description,
            @RequestParam String price,
            @RequestParam String shopName,
            @RequestParam String shopUrl,
            @PathVariable Long category_id,
            Model model,
            @RequestParam(value = "file") MultipartFile file
    ) throws IOException {
        Product product = new Product();
        product.setName(name);
        product.setBrandName(brandName);
        product.setDescription(description);
        product.setPrice(Float.parseFloat(price));
        product.setShopName(shopName);
        product.setShopUrl(shopUrl);

        Category category = categoryRepo.getCategoryById(category_id);
        product.setCategory(category);
        productService.saveFile(product, file, uploadPath);
        productRepo.save(product);

        List<Product> products = productRepo.findAllByCategory_Id(category_id);
        model.addAttribute("products", products);
        model.addAttribute("product", product);
        return "redirect:/product/" + category_id;
    }

    @PostMapping("/product-delete/{product_id}")
    public String deleteProduct(@PathVariable Long product_id) {
        Product product = productRepo.getProductById(product_id);
        Long category_id = product.getCategory().getId();
        productRepo.delete(product);

        return "redirect:/product/" + category_id;
    }
}
