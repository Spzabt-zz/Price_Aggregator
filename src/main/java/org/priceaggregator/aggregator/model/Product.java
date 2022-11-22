package org.priceaggregator.aggregator.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Set;

@Getter
@Setter
@AllArgsConstructor
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String filename;

    @NotBlank(message = "Введіть назву продукту")
    private String name;

    @NotBlank(message = "Введіть назву бренду")
    private String brandName;

    @NotNull(message = "Введіть ціну")
    private Float price;

    @NotBlank(message = "Введіть опис продукту")
    private String description;

    @NotBlank(message = "Введіть назву магазину")
    private String shopName;

    private String shopUrl;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Comparison> comparison;

    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Comment> comments;

    public Product() {

    }
}
