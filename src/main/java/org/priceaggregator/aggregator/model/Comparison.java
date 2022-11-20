package org.priceaggregator.aggregator.model;

import lombok.*;

import javax.persistence.*;
import java.util.Set;

//@Data
@Getter
@Setter
@AllArgsConstructor
@Entity
public class Comparison {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    /*@OneToMany(mappedBy = "comparison", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Product> products;*/

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @ToString.Exclude
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id")
    @ToString.Exclude
    private Product product;

    public Comparison() {

    }
}
