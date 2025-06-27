package com.silicasoft.applicationBackend.service;

import com.silicasoft.applicationBackend.entity.Category;
import io.swagger.v3.oas.annotations.servers.Server;
import jakarta.transaction.Transactional;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Transactional
public interface CategoryService {
    void addCategory(Category category);

    List<Category> getAllCategorys();
}
