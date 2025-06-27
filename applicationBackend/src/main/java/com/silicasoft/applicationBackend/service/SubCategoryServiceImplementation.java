package com.silicasoft.applicationBackend.service;

import com.silicasoft.applicationBackend.entity.SubCategory;
import com.silicasoft.applicationBackend.repository.SubCategoryRepository;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
@RequiredArgsConstructor

public class SubCategoryServiceImplementation implements SubCategoryService {

    @Autowired
    final SubCategoryRepository subCategoryRepository;

    @Override
    public void addSubCategory(SubCategory subCategory) {

        subCategoryRepository.save(subCategory);
    }
}
