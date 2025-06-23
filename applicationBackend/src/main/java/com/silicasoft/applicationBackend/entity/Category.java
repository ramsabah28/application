package com.silicasoft.applicationBackend.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


import java.util.UUID;

@Entity
@Table(name = "category")
@NoArgsConstructor
@AllArgsConstructor
@Data

@Builder
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;

    private String imageUrl;

    private String name;
/**
 @OneToMany(mappedBy = "category", cascade = CascadeType.ALL, orphanRemoval = true)
 private List<SubCategorys> subCategorys = new ArrayList<>();
 **/
}
