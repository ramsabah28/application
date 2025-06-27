package com.silicasoft.applicationBackend.service;

import com.silicasoft.applicationBackend.entity.Category;
import com.silicasoft.applicationBackend.repository.CategoryRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

@Service
@Transactional
@RequiredArgsConstructor

public class CategoryServiceImplementation implements CategoryService {
    @Autowired
    public CategoryRepository categoryRepository;

    @Override
    public void addCategory(Category category) {
        categoryRepository.save(category);

    }

    @Override
    public List<Category> getAllCategorys() {
        Iterable<Category> iterable = categoryRepository.findAll();
        List<Category> categoryList = StreamSupport
                .stream(iterable.spliterator(), false)
                .collect(Collectors.toList());
        return categoryList;
    }

}

