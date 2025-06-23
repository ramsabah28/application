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
@Tag(name = "Category Controller", description = "Manage Categorys,, endpoint")
public class CategoryController {

    @Autowired
    public CategoryService categoryService;

    @PostMapping("/add")
    @Operation(
            summary = "Lebenszeichen des Produktservices",
            description = "Test for return OK, Server Startet and connected"
    )
    public ResponseEntity<String> addCategory(@RequestBody Category category) {
        categoryService.addCategory(category);
        return new ResponseEntity<>("OK", HttpStatus.OK);
    }
}
