package com.silicasoft.applicationBackend.dto;

import com.silicasoft.applicationBackend.entity.SubCategorys;
import lombok.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDto {

    private UUID id;

    private String imageUrl;

    private String name;


}
