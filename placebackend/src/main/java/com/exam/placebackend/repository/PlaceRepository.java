package com.exam.placebackend.repository;

import com.exam.placebackend.model.Place;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PlaceRepository extends JpaRepository<Place, Long> {
}