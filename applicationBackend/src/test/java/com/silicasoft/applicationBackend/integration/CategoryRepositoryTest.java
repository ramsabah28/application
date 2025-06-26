package com.silicasoft.applicationBackend.integration;

import com.silicasoft.applicationBackend.entity.Category;
import com.silicasoft.applicationBackend.entity.SubCategorys;
import com.silicasoft.applicationBackend.repository.CategoryRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.assertThat;

@DataJpaTest
class CategoryRepositoryTest {

    @Autowired
    private CategoryRepository categoryRepository; // Ändern

    @Test
    @DisplayName("Save and retrieve a Category")
    void testSaveAndFindCategory() {

        Category category = Category.builder()
                .name("Electronics")
                .imageUrl("http://example.com/image.jpg")
                .build();

        Category savedCategory = categoryRepository.save(category);

        Optional<Category> found = categoryRepository.findById(savedCategory.getId());

        assertThat(found).isPresent();
        assertThat(found.get().getName()).isEqualTo("Electronics");
        assertThat(found.get().getImageUrl()).isEqualTo("http://example.com/image.jpg");
    }

    @Test
    @DisplayName("save Category with SubCategories")
    void testSaveCategoryWithSubCategories() {
        SubCategorys sub1 = new SubCategorys();
        sub1.setName("Phones");

        SubCategorys sub2 = new SubCategorys();
        sub2.setName("Laptops");

        Category category = Category.builder()
                .name("Electronics")
                .imageUrl("http://example.com/electronics.jpg")
                .build();

        sub1.setCategory(category);
        sub2.setCategory(category);
        category.setSubCategorys(List.of(sub1, sub2));

        Category saved = categoryRepository.save(category);

        assertThat(saved.getSubCategorys()).hasSize(2);
        assertThat(saved.getSubCategorys().get(0).getName()).isEqualTo("Phones");
    }
}
