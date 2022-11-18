package org.priceaggregator.aggregator.model;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String brandName;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id")
    private Category category;

    public Brand() {

    }
}
