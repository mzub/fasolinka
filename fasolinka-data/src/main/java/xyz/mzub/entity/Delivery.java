package xyz.mzub.entity;

import java.time.LocalDate;
import java.time.ZonedDateTime;

import javax.persistence.Entity;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "deliveries")
public class Delivery {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated
    private DeliveryStatus status;

    private LocalDate deliveryDate;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    private ZonedDateTime creationTime;

    private ZonedDateTime updateTime;

}
