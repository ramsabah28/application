package com.silicasoft.applicationBackend.mapper;

import com.silicasoft.applicationBackend.dto.CategoryDto;
import com.silicasoft.applicationBackend.entity.Category;

public class CategoryMapper {
    public static CategoryDto toDto(Category category) {

        return CategoryDto.builder()
                .id(category.getId())
                .name(category.getName())
                .imageUrl(category.getImageUrl())
                .build();

    }
}
