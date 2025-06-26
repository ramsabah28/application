package com.silicasoft.applicationBackend;

import io.swagger.v3.oas.annotations.OpenAPIDefinition;
import io.swagger.v3.oas.annotations.info.Info;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@OpenAPIDefinition(
		info = @Info(
				title = "Application Backend API",
				version = "1.0",
				description = "Documentation for the Spring Boot backend"
		)
)
public class ApplicationBackendApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApplicationBackendApplication.class, args);
	}

}
