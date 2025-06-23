package com.silicasoft.applicationBackend.service;

import com.silicasoft.applicationBackend.entity.Category;
import com.silicasoft.applicationBackend.repository.CategoryRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@Transactional
@RequiredArgsConstructor

public class CategoryServiceImplementation implements CategoryService {
    public final CategoryRepository categoryRepository;

    @Override
    public void addCategory(Category category) {
        categoryRepository.save(category);

    }
}
