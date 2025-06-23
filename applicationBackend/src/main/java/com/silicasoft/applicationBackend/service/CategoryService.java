package com.silicasoft.applicationBackend.service;

import com.silicasoft.applicationBackend.entity.Category;
import io.swagger.v3.oas.annotations.servers.Server;
import org.springframework.stereotype.Service;


public interface CategoryService {
     void addCategory(Category category);
}
