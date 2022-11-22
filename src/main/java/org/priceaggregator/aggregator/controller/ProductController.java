package org.priceaggregator.aggregator.controller;

import org.priceaggregator.aggregator.model.*;
import org.priceaggregator.aggregator.repository.*;
import org.priceaggregator.aggregator.service.ProductService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.Valid;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
public class ProductController {
    private final ProductRepo productRepo;
    private final CategoryRepo categoryRepo;
    private final ProductService productService;
    private final BrandRepo brandRepo;
    private final CommentRepo commentRepo;
    private final ComparisonRepo comparisonRepo;

    @Value("${upload.path}")
    private String uploadPath;

    public ProductController(ProductRepo productRepo, CategoryRepo categoryRepo, ProductService productService, BrandRepo brandRepo, CommentRepo commentRepo, ComparisonRepo comparisonRepo) {
        this.productRepo = productRepo;
        this.categoryRepo = categoryRepo;
        this.productService = productService;
        this.brandRepo = brandRepo;
        this.commentRepo = commentRepo;
        this.comparisonRepo = comparisonRepo;
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
            products = productRepo.findAllByBrandNameAndCategory_IdOrderByPriceDesc(filter, category_id);
        else if (filter != null && !filter.isEmpty() &&
                filterByPrice != null && filterByPrice.equals("0")) {
            products = productRepo.findAllByBrandNameAndCategory_IdOrderByPriceAsc(filter, category_id);
        } else if (filter != null && !filter.isEmpty()) {
            products = productRepo.findAllByBrandNameAndCategory_Id(filter, category_id);
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

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/product/{category_id}")
    public String productAdding(
            @PathVariable Long category_id,
            @Valid Product product,
            BindingResult bindingResult,
            Model model,
            @RequestParam(value = "file") MultipartFile file
    ) throws IOException {
        List<Product> products = productRepo.findAllByCategory_Id(category_id);
        List<Brand> brands = brandRepo.findAllByCategory_Id(category_id);

        model.addAttribute("brands", brands);
        model.addAttribute("products", products);
        model.addAttribute("category_id", category_id);

        if (bindingResult.hasErrors()) {
            Map<String, String> errorMap = ControllerUtils.getErrors(bindingResult);

            model.mergeAttributes(errorMap);
            model.addAttribute("product", product);
            return "product";
        } else {
            Category category = categoryRepo.getCategoryById(category_id);
            product.setCategory(category);
            productService.saveFile(product, file, uploadPath);
            model.addAttribute("product", null);
            productRepo.save(product);
        }

        return "redirect:/product/" + category_id;
    }

    @GetMapping("/product-details/{product_id}")
    public String productDetails(Model model, @PathVariable Long product_id) {
        Product product = productRepo.getProductById(product_id);
        List<Comment> comments = commentRepo.findAllByProduct(product);

        model.addAttribute("comments", comments);
        model.addAttribute("product", product);

        return "productDetails";
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @PostMapping("/product-delete/{product_id}")
    public String deleteProduct(@AuthenticationPrincipal User user, @PathVariable Long product_id) {
        Product product = productRepo.getProductById(product_id);
        List<Comparison> comparisons = comparisonRepo.findAllByProduct(product);
        List<Comment> comments = commentRepo.findAllByProduct(product);

        Long category_id = product.getCategory().getId();
        comparisonRepo.deleteAll(comparisons);
        commentRepo.deleteAll(comments);
        productRepo.delete(product);

        return "redirect:/product/" + category_id;
    }
}
