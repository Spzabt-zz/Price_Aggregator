package org.priceaggregator.aggregator.controller;

import org.priceaggregator.aggregator.model.Brand;
import org.priceaggregator.aggregator.model.Category;
import org.priceaggregator.aggregator.model.Product;
import org.priceaggregator.aggregator.repository.BrandRepo;
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
import java.util.Set;

@Controller
public class ProductController {
    private final ProductRepo productRepo;
    private final CategoryRepo categoryRepo;
    private final ProductService productService;
    private final BrandRepo brandRepo;

    @Value("${upload.path}")
    private String uploadPath;

    public ProductController(ProductRepo productRepo, CategoryRepo categoryRepo, ProductService productService, BrandRepo brandRepo) {
        this.productRepo = productRepo;
        this.categoryRepo = categoryRepo;
        this.productService = productService;
        this.brandRepo = brandRepo;
    }

    @GetMapping("/category")
    public String category(Model model) {
        Iterable<Category> categories = categoryRepo.findAll();
        model.addAttribute("categoryName", categories);
        return "category";
    }

    @GetMapping("/product/{category_id}")
    public String product(Model model,
                          @RequestParam(required = false, defaultValue = "") String filter,
                          @RequestParam(required = false, defaultValue = "") String filterByPrice,
                          @PathVariable Long category_id) {
        List<Product> products;

        if (filter != null && !filter.isEmpty() &&
                filterByPrice != null && filterByPrice.equals("1"))
            //products = productRepo.findAllByBrandName(filter);
            products = productRepo.findAllByBrandNameOrderByPriceDesc(filter);
        else if (filter != null && !filter.isEmpty() &&
                filterByPrice != null && filterByPrice.equals("0")) {
            products = productRepo.findAllByBrandNameOrderByPriceAsc(filter);
        } else if (filter != null && !filter.isEmpty()) {
            products = productRepo.findAllByBrandName(filter);
        } else if (filterByPrice != null && filterByPrice.equals("1")) {
            products = productRepo.findAllByCategory_IdOrderByPriceDesc(category_id);
        } else if (filterByPrice != null && filterByPrice.equals("0")) {
            products = productRepo.findAllByCategory_IdOrderByPriceAsc(category_id);
        } else
            products = productRepo.findAllByCategory_Id(category_id);

        List<Brand> brands = brandRepo.findAllByCategory_Id(category_id);

        model.addAttribute("brands", brands);
        model.addAttribute("products", products);
        model.addAttribute("category_id", category_id);
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

        //model.addAttribute("brands", category.getBrands());
        model.addAttribute("products", products);
        model.addAttribute("product", product);
        return "redirect:/product/" + category_id;
    }

    @GetMapping("/product-details/{product_id}")
    public String productDetails(Model model, @PathVariable Long product_id) {
        Product product = productRepo.getProductById(product_id);

        model.addAttribute("product", product);

        return "productDetails";
    }

    @PostMapping("/product-delete/{product_id}")
    public String deleteProduct(@PathVariable Long product_id) {
        Product product = productRepo.getProductById(product_id);
        Long category_id = product.getCategory().getId();
        productRepo.delete(product);

        return "redirect:/product/" + category_id;
    }
}
