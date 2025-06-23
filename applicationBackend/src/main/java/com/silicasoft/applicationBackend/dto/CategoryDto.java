package com.silicasoft.applicationBackend.dto;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.*;

import java.io.Serializable;
import java.util.UUID;

@Getter
@Setter
@Builder
@Schema(description = "Manages Category Objects")
public class CategoryDto  {

    private UUID id;

    private String name;

    private String imageUrl;
}
