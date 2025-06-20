package com.silicasoft.applicationBackend.entity;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import java.util.UUID;


@Entity
@Table(name = "products")
@Getter
@Setter
@ToString
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    private String imageUrl;

    private String brand;

    private String titel;

    private String description;

    private float price;

    private float rating;


}
