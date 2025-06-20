package com.silicasoft.applicationBackend.controller;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/product")
@Tag(name = "Product Controller", description = "Manage product,, endpoint")
public class ProdoctController {

    @GetMapping("/signal")
    @Operation(
            summary = "Lebenszeichen des Produktservices",
            description = "Test for return OK, Server Startet and connected"
    )
    public ResponseEntity<String> getSignal() {
        return new ResponseEntity<>("OK", HttpStatus.OK);
    }
}
