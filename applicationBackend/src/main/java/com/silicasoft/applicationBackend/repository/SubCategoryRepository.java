package com.silicasoft.applicationBackend.repository;

import com.silicasoft.applicationBackend.entity.SubCategory;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface SubCategoryRepository extends CrudRepository<SubCategory, UUID> {
}
