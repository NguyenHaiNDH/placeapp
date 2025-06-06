package com.exam.placebackend.service;




import com.exam.placebackend.model.Place;
import com.exam.placebackend.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
@Service
public class PlaceService {
    @Autowired
    private PlaceRepository repo;

    public List<Place> getAllPlaces() {
        return repo.findAll();
    }
}

