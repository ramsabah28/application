package com.silicasoft.applicationBackend.service;

import com.silicasoft.applicationBackend.entity.SubCategory;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

@Service
@Transactional
public interface SubCategoryService {

    void addSubCategory(SubCategory subCategory);
}
