package org.priceaggregator.aggregator.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Set;

@Data
@Entity
public class Comparison {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToMany(mappedBy = "comparison", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Product> products;

    public Comparison() {

    }
}
