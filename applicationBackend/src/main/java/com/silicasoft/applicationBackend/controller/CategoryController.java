package com.silicasoft.applicationBackend.controller;

import com.silicasoft.applicationBackend.entity.Category;
import com.silicasoft.applicationBackend.service.CategoryService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/category")
@Tag(name = "Category Controller", description = "Manage Categories endpoint")
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @PostMapping("/add")
    @Operation(
            summary = "Add a new category",
            description = "Adds a category using the request body and returns OK if successful."
    )
    public ResponseEntity<String> addCategory(@RequestBody Category category) {
        categoryService.addCategory(category);
        return new ResponseEntity<>("OK", HttpStatus.OK);
    }
}
