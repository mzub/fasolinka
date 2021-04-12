package xyz.mzub.entity;

import java.math.BigDecimal;
import java.time.ZonedDateTime;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "products")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true)
    @NotNull
    private String title;

    @NotNull
    private BigDecimal price;

    @NotNull
    private String description;

    @NotNull
    private Integer quantity;

    private BigDecimal discount;

    @NotNull
    private ZonedDateTime creationTimestamp;

    private ZonedDateTime updateTimestamp;

    @ManyToMany
    @JoinTable(name = "products_categories", joinColumns = { @JoinColumn(name = "product_id") }, inverseJoinColumns = {
            @JoinColumn(name = "category_id)") })
    private Set<Category> categories;

    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;

    @OneToMany(mappedBy = "products")
    private Set<Picture> pictures;

    @OneToMany(mappedBy = "products")
    private Set<OrderItem> orderItems;

}
